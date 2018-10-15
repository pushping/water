function option_lists($lists){
    $html = '';
    $.each($lists,function($i,$o){
        var num = parseInt($o['deepth']);
        var space = new Array(num).join("&nbsp;&nbsp;&nbsp;&nbsp;");
        $html += "<option value=\""+$o['id']+"\" parentid=\""+$o['parentid']+"\">"+space+"|—"+$o['name']+"</option>";
        if($o['childs']!==undefined){
            $html += option_lists($o['childs']);
        }
    })
    return $html;
}
function selectOrg(){
    var ajax = Tool.http();
    ajax.get("index.php?_url=admin/organization/getData",function(res){
        var org_html = '<option value="0">请选择管理单位</option>'+option_lists(res);
        $("#org_id").append(org_html);
    })
}
function selectArea(){
    var ajax = Tool.http();
    ajax.get("index.php?_url=admin/area/getData",function(res){
        var area_html = '<option value="0">请选择管理区域</option>'+option_lists(res);
        $("#area_id").append(area_html);
    })
}