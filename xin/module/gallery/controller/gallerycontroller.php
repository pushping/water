<?php

namespace Xin\Module\Gallery\Controller;

use Xin\App\Admin\Controller\basecontroller;
use Xin\Lib\Uploader;
use Xin\Module\Gallery\Model\Gallery;

class GalleryController extends basecontroller
{
    public function uploadAction()
    {

        if ($this->request->hasFiles()) {
            $upload = new Uploader([
                'exts'=>'jpg,png,gif',
                'rootPath'=>$this->config['module']['gallery']['uploadDir']
            ]);

            foreach ($this->request->getUploadedFiles() as $file) {
                try {
                        $data = $upload->upload($file);
                        $pic=new Gallery();
                        $pic->uid = $this->getDI()->get('auth')->getTicket()['uid'];
                        $pic->title=$data['name'];
                        $pic->size=$data['size'];
                        $pic->path=$data['savepath'].$data['savename'];
                        $pic->object_sn='';
                        $pic->group='';
                        $pic->create_time=time();
                        $pic->update_time=time();

                        if($pic->save()==false){
                            throw new \Exception(implode(';',$pic->getMessages()));
                        }     
                        $data=[
                            'name'=>basename($pic->title),
                            'imgid'=>$pic->id,
                        ];

                        $this->view->setVar('file',$data);             
                } catch (\Exception $e) {
                    $this->di->get('logger')->error($e->getMessage());
                    return new \Xin\Lib\MessageResponse('上传图片失败','error',[],500);
                }
            }
        } else {
            return new \Xin\Lib\MessageResponse("暂无上传图片",'error',[],500);
        }
    }

    public function delimgAction(){
        $id = $this->request->getPost('id');
        if($id){
            $gallery = Gallery::findFirstById($id);
            $path = $gallery->path;

            if($gallery->delete()==false){
                return new \Xin\Lib\MessageResponse("删除失败！");    
            }
        }else{
            $path = $this->request->getPost('path');
        }
        
        chmod($path , 0777);
        if (unlink($path)) {
            return new \Xin\Lib\MessageResponse(["path"=>$path], 'succ',['ok'=>Utils::url('address/list')]);
        }else{
            return new \Xin\Lib\MessageResponse("删除失败！");    
        }
    }
}