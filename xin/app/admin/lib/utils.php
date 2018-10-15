<?php
namespace Xin\App\Admin\Lib;

use Xin\App\Admin\Model\Menu;
use Xin\Module\Area\Model\Area;
use Xin\Module\Organization\Model\Organization;

class Utils {
	/**
	 * 节点转为树
	 */
	public static function nodeToTree($node_list,$pid=0,$rootid = 0){
	    $nodes = $tmp_arr = [];
	    foreach ($node_list as $k => $v) {
	        if($v['parentid']==$pid){
	            if($rootid  && $v['id']!=$rootid){
	                continue;
                }
	            $v['link']=$v['url']!='' && strpos($v['url'],":")===false ? \Xin\Lib\Utils::url($v['url']):$v['url'];
	            $tmp_arr = self::nodeToTree($node_list, $v['id']);
	            if($tmp_arr){
	                $v['son'] = $tmp_arr;
	            }
	            $nodes[] = $v;
	            unset($node_list[$k]);
	        }
	    }
	    return $nodes;
	}

    /**
     * 节点转为多棵树（允许多个根节点）
     */
    public static function nodeToMuiltTree($node_list){
        $tmp_arr = $node_list;
        foreach ($node_list as &$item){
            $item['isChild']= 0;
            foreach ($tmp_arr as $temp){
                if(intval($item['parentid']) == intval($temp['id'])){
                    $item['isChild'] = 1;break;
                }
            }
        }unset($item);
        $nodesList = [];
        foreach ($node_list as $item){
            if(!$item['isChild']  ){
                $res = self::nodeToTree($node_list,$item['parentid'],$item['id']);
                $nodesList = array_merge($nodesList,$res);
            }
        }
        return $nodesList;
    }

	/**
	 * 创建节点菜单
	 */
	public static function createNodeHtml(&$html,$node,$all_parent){

	    $href = $node['link'] ? $node['link']."&menuid=".$node['id'] : 'javascript:;';
	    $icon = '';
	    if($node['settings']){
	        $settings = json_decode($node['settings'],true);
	        if($settings && $settings["icon"]) $icon = "<i class='fa {$settings["icon"]}'></i>";
	    }
		$active = in_array($node['id'],$all_parent)?'class="active"':'';
		
	    if(!empty($node["son"])){
	        $html.="<li {$active}><a href='{$href}' class='parentid-{$node["parentid"]}'>{$icon}</span><span class='nav-label'>{$node["title"]}</span> <span class='fa arrow'></span></a><ul class='nav nav-second-level'>";
	        foreach($node["son"] as $i=>$son){
	            self::createNodeHtml($html,$son,$all_parent);
	        }
	        $html.="</ul></li>";
	    }else if(empty($node["son"]) && $node['settings']==NULL){
	        $html.="<li {$active}><a href='{$href}' class='parentid-{$node["parentid"]}'>{$icon} {$node["title"]}</a></li>";
	    }else{
			$html.="<li {$active}><a href='{$href}' class='parentid-{$node["parentid"]}'>{$icon}<span class='nav-label'> {$node["title"]}</span></a></li>";
		}
	}

	/**
	 * 获取菜单数据
	 */
	public static function getMenusData($menuid,$ticket=false){
		$src_array = [];
	    $parent_id_arr = [];
	    $res = Menu::findFirst([
	        'conditions' => 'id = :menuid: ',
	        'bind' => [
	            'menuid' => $menuid
	        ],
	    ]);
	    if(!$res) return [];
	    $src_array[] = $res->toArray();
	    $first_parent = $res->parentid;
	    if($first_parent > 0){
	        $parent_id_arr[] = $first_parent;
	        $res = Menu::findFirst([
	            'conditions' => 'id = :id: ',
	            'bind' => [
	                'id' => $first_parent
	            ],
	        ]);
	        if($res){
	        	$src_array[] = $res->toArray();
	            $second_parent = $res->parentid;
	            if($second_parent > 0){
	                $parent_id_arr[] = $second_parent;
	                $res = Menu::findFirst([
	                    'conditions' => 'id = :id: ',
	                    'bind' => [
	                        'id' => $second_parent
	                    ],
	                ]);
	                if($res){
	                	$src_array[] = $res->toArray();
	                    $third_parent = $res->parentid;
	                    if($third_parent > 0){
	                        $parent_id_arr[] = $third_parent;
	                    }
	                }
	            }
	        }
	    }else{
	        return [[],[$menuid],$src_array];
	    }

	    // 取符合条件的菜单
	    if($ticket['uid'] != 1){
	    	$conditions = "(object_type='User' AND object_value=".intval($ticket['uid']).")";
	    	if (!empty($ticket['roles'])) {
	    	    $role_id = [];
	    	    foreach ($ticket['roles'] AS $role) {
	    	        $role_id[] = $role['id'];
	    	    }
	    	    if (!empty($role_id)) {
	    	        $role_ids = implode(',', $role_id);
	    	        $conditions .= " OR (object_type = 'Role' AND object_value in (".$role_ids."))";
	    	    }
	    	}
	    	$result = \Xin\App\Admin\Model\Access::find([
	    		$conditions,
	    		'columns'=>'menu_id'
	    	])->toArray();
	    	if($result){
	    		$menu_ids = array_unique(array_column($result, 'menu_id'));
	    		$res = Menu::find([
	    		    'conditions' => 'isshow=1 AND ( id IN ({parent_id_arr:array}) OR parentid IN ({parent_id_arr:array}) ) AND id IN ({menu_ids:array})',
	    		    'bind' => [
	    		        'parent_id_arr' => $parent_id_arr,
	    		        'menu_ids'=>array_values($menu_ids)
	    		    ],
	    		    'order'=>' listorder asc '
	    		]);
	    	}else{
	    		$res = false;
	    	}
	    }else{
	    	$res = Menu::find([
	    	    'conditions' => 'isshow=1 AND ( id IN ({parent_id_arr:array}) OR parentid IN ({parent_id_arr:array}) ) ',
	    	    'bind' => [
	    	        'parent_id_arr' => $parent_id_arr,
	    	    ],
	    	    'order'=>' listorder asc '
	    	]);
	    }
	    if($res){
	    	$tmp_arr = $res->toArray();
	    	$id_arr = [];
	    	foreach ($tmp_arr as $v) {
	    		if($v['parentid'] != 0){
	    			$id_arr[] = $v['id'];
	    		}
	    	}
	    	$id_arr = $id_arr ?: [0];
	    	$res = Menu::find([
	    	    'conditions' => 'isshow=1 AND ( parentid IN ({id_arr:array}) ) ',
	    	    'bind' => [
	    	        'id_arr' => $id_arr,
	    	    ],
	    	    'order'=>' listorder asc '
	    	]);
	    	if($res){
	    		$tmp_arr = self::uniqueByKey(array_merge($tmp_arr,$res->toArray()),'id');
	    	}
	        $tree = self::nodeToTree($tmp_arr);
	        $all_parent = $parent_id_arr;
	        $all_parent[] = $menuid;
	        if($tree[0]['son']){
	            $node_html="";
	            foreach($tree[0]['son'] as $node){
	                self::createNodeHtml($node_html,$node,$all_parent);
	            }
	            return [$node_html,$all_parent,$src_array];
	        }
	    }
	    return [];
	}

	/**
	 * 二维数组中去掉某项重复的数组
	 */
	public static function uniqueByKey($arr,$key){
		$unique_arr = [];
		$unique_key_arr = [];
		foreach ($arr as $v) {
			if(!in_array($v[$key], $unique_key_arr)){
				$unique_key_arr[] = $v[$key];
				$unique_arr[] = $v;
			}
		}
		return $unique_arr;
	}

	/**
	 * 创建菜单管理的菜单树
	 */
	public static function createMenuHtml(&$html,$node){
		if(!empty($node["son"])){
		    $html.="<li class='dd-item' data-id='{$node["id"]}' data-listorder='{$node["listorder"]}'><div class='dd-handle'><i class='fa fa-arrows'></i></div><div class='dd-content' data-id='{$node["id"]}' data-listorder='{$node["listorder"]}' data-href='{$node["url"]}'  data-icon='{$node["settings"]["icon"]}' data-isshow='{$node["isshow"]}'>{$node["title"]}</div><ol class='dd-list'>";
		    foreach($node["son"] as $i=>$son){
		        self::createMenuHtml($html,$son);
		    }
		    $html.="</ol></li>";
		}else{
		    $html.="<li class='dd-item' data-id='{$node["id"]}' data-listorder='{$node["listorder"]}'><div class='dd-handle'><i class='fa fa-arrows'></i></div><div class='dd-content' data-id='{$node["id"]}' data-listorder='{$node["listorder"]}' data-href='{$node["url"]}'  data-icon='{$node["settings"]["icon"]}' data-isshow='{$node["isshow"]}'>{$node["title"]}</div></li>";
		}
	}

	/**
	 * 根据当前_url取muenid
	 */
	public static function getMuenidByUrl($url){
		if($url == 'admin/device/list' && isset($_GET['type'])){
			$device_url = $url.'&type='.$_GET['type'];
			$device_url2 = $url.'?type='.$_GET['type'];
			$res = Menu::findFirst([
			  'conditions' => 'url = :url: OR url = :url2:',
			  'bind' => [
			    'url' => $device_url,
			    'url2' => $device_url2,
			  ],
			]);
			if($res) return $res->id;
		}
		if($url == 'admin/order/list' && isset($_GET['status'])){
			$order_url = $url.'&status='.$_GET['status'];
			$order_url2 = $url.'?status='.$_GET['status'];
			$res = Menu::findFirst([
			  'conditions' => 'url = :url: OR url = :url2:',
			  'bind' => [
			    'url' => $order_url,
			    'url2' => $order_url2,
			  ],
			]);
			if($res) return $res->id;
		}
		if($url == 'admin/alarm/list' && isset($_GET['type'])){
			$alarm_url = $url.'&type='.$_GET['type'];
			$alarm_url2 = $url.'?type='.$_GET['type'];
			if(isset($_GET['level'])){
				$alarm_url .= '&level='.$_GET['level'];
				$alarm_url2 .= '&level='.$_GET['level'];
			}
			$res = Menu::findFirst([
			  'conditions' => 'url = :url: OR url = :url2:',
			  'bind' => [
			    'url' => $alarm_url,
			    'url2' => $alarm_url2,
			  ],
			]);
			if($res) return $res->id;
		}
		$res = Menu::findFirst([
		  'conditions' => 'url LIKE :url:',
		  'bind' => [
		    'url' => $url.'%',
		  ],
		]);
		if($res) return $res->id;
		return 0;
	}

	/**
	 * 创建角色编辑页的dom
	 */
	public static function createRoleNodeHtml(&$html,$node){
		if(!empty($node["son"])){
		    $html.="<li ".($node["parentid"]==='0'?'class="li-root"':'')."><span><input  id='{$node["id"]}' type='checkbox'/>&nbsp;{$node["title"]}</span><ul>";
		    foreach($node["son"] as $i=>$child_node){
		        self::createRoleNodeHtml($html,$child_node);
		    }
		    $html.="</ul></li>";
		}else{
		    $html.="<li><span><input class='check-leef' id='{$node["id"]}' type='checkbox'/>&nbsp;{$node["title"]}</span></li>";
		}
	}

	/**
	 * 获取区域或组织的树形option
	 * @param  string $type 类型  area:区域  organization:组织
	 * @param  string $id   值(相等输出高亮)
	 * @return string       树形option
	 */
	public static function getTreeOptionHtml($type='area' ,$id=0,$limitArray = []){
        $bind = empty($limitArray)?[]:['ids'=>$limitArray];
		if($type == 'area'){
			$res = Area::find([
			    'order'=>' id asc ',
                'columns'=>'id,name,parentid,deepth',
                'conditions' => empty($limitArray)?"":" id in ({ids:array})",
                'bind'=>$bind
            ])->toArray();
		}else{
			$res = Organization::find([
			    'order'=>' id asc ',
                'columns'=>'id,name,parentid,deepth',
                'conditions' => empty($limitArray)?"":" id in ({ids:array})",
                'bind'=>$bind
            ])->toArray();
		}
		$rs = self::nodeToMuiltTree($res);
		$node_html="";
		foreach($rs as $i=>$node){
		    self::createOptionHtml($node_html,$node,$id);
		}
		return $node_html;
	}

	/**
	 * 创建树形option dom
	 */
	public static function createOptionHtml(&$html,$node,$id){
	    $selected = $node['id']==$id?'selected':'';
	    $space = $node['deepth']>0?str_repeat('&nbsp;&nbsp;&nbsp;&nbsp;',$node['deepth']-1):'';
	    var_dump($space);
	    $html.="<option value='{$node["id"]}' $selected>{$space}|—{$node["name"]}</option>";
	    if(!empty($node["son"])){
	        foreach($node["son"] as $i=>$son){
	            self::createOptionHtml($html,$son,$id);
	        }
	    }
	}



	//取设备的uuid
    public static function getDeviceUuid($imei,$manufacturerId,$deviceTypeId,$device_bind){
    	$api = $device_bind->api_url;
        $params =  [
            "appKey"=>$device_bind->appKey,
            "manufacturerId"=>$manufacturerId,
            "deviceTypeId"=>$deviceTypeId,
            "imei"=>$imei
        ];
        $params = json_encode($params);
        $curl = curl_init($api);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $params);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json;charset=UTF-8',
            'Content-Length: ' . strlen($params)
        ));
        $ret = curl_exec($curl);
        if($ret) $ret = json_decode($ret,true);
        curl_close($curl);
        if (empty($ret) || !isset($ret['res_code'])) {
            return ['res_code'=>999,'res_message'=>'绑定设备接口异常'];
        }
        return $ret;
	}
    public static function getAreaTree($areaIds=[]){
	    if($areaIds){
            $res = Area::find([
                'conditions' => "area_type in (1,2,3,4,6) and id in ({aids:array})",
                'bind'=>['aids'=>$areaIds]
            ])->toArray();
        }else{
            $res = Area::find([
                'order'=>' id asc ',
                'columns'=>'*',
                'conditions' => "area_type in (1,2,3,4,6)",
            ])->toArray();
        }

        $rs = self::nodeToTree($res,$res[0]['parentid']);
        return $rs;
    }


}