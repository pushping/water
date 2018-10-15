//获取分页条 
function getPageBar(count,page,pagesize){
    var i = 1;
    page = Number(page);
    var totalPage = Math.ceil(count / pagesize);
 //页码大于最大页数 
    if(page>totalPage) page=totalPage; 
    //页码小于1 
    if(page<1) page=1; 
    pageStr = "<div class='page_info pull-left'>当前第"+page+"页,共"+totalPage+"页,共"+count+"条</div>";
    //如果是第一页 
    pageStr += "<div class='btn-group pull-right'>"
    if(page==1){ 
        pageStr += "<button class='disabled btn btn-white btn-sm'>首页</button><button class='disabled btn btn-white btn-sm'>上一页</button>";
    }else{ 
        pageStr += "<button class='btn btn-white btn-sm'><a href='javascript:void(0)' rel='1'>首页</a></button><button class='btn btn-white btn-sm'><a href='javascript:void(0)' rel='"+(page-1)+"'>上一页</a></button>"; 
    } 
    if (totalPage <= 5 ) {//总页数小于五页，则加载所有页  
        for (i; i <= totalPage; i++) {
            if (i == page) {
                pageStr += "<button class='disabled btn btn-white btn-sm'>"+i+"</button>";
            }else{
                pageStr += "<button class='btn btn-white btn-sm'><a href='javascript:void(0)' rel='"+i+"'>"+i+"</a></button>"; 
            }
        };
    }else if (totalPage > 5) {//总页数大于五页，则加载五页
        if (page < 5) {//当前页小于5，加载1-5页
            for (i; i <= 5; i++) {
                if (i == page) {
                    pageStr += "<button class='disabled btn btn-white btn-sm'>"+i+"</button>"; 
                }else{
                    pageStr += "<button class='btn btn-white btn-sm'><a href='javascript:void(0)' rel='"+i+"'>"+i+"</a></button>"; 
                }
            };
           
        }else if (page >= 5) {//当前页大于5页
            // for (i; i <= 2; i++) {//1,2页码始终显示
            //     pageStr += "<button><a href='javascript:void(0)' rel='"+i+"'>"+i+"</a></button>"; 
            // }
            if (page+1 == totalPage) {//当前页+1等于总页码
                for(i = page-3; i <= totalPage; i++){//“...”后面跟三个页码当前页居中显示
                    if (i == page) {
                        pageStr += "<button class='disabled btn btn-white btn-sm'>"+i+"</button>"; 
                    }else{
                        pageStr += "<button class='btn btn-white btn-sm'><a href='javascript:void(0)' rel='"+i+"'>"+i+"</a></button>"; 
                    }
                }
            }else if (page == totalPage) {//当前页数等于总页数则是最后一页页码显示在最后
                for(i = page-4; i <= totalPage; i++){//...后面跟三个页码当前页居中显示
                    if (i == page) {
                        pageStr += "<button class='disabled btn btn-white btn-sm'>"+i+"</button>"; 
                    }else{
                        pageStr += "<button class='btn btn-white btn-sm'><a href='javascript:void(0)' rel='"+i+"'>"+i+"</a></button>"; 
                    }
                }
            }else{//当前页小于总页数，则最后一页后面跟...
                for(i = page-2; i <= page+2; i++){//page+1页后面...
                    if (i == page) {
                        pageStr += "<button class='disabled btn btn-white btn-sm'>"+i+"</button>"; 
                    }else{
                        pageStr += "<button class='btn btn-white btn-sm'><a href='javascript:void(0)' rel='"+i+"'>"+i+"</a></button>"; 
                    }
                }
            }
        }
    }
     
    //如果是最后页 
    if(page>=totalPage){ 
        pageStr += "<button class='disabled btn btn-white btn-sm'>下一页</button><button class='disabled btn btn-white btn-sm'>尾页</button></div>";
    }else{ 
        pageStr += "<button class='btn btn-white btn-sm'><a href='javascript:void(0)' rel='"+(parseInt(page)+1)+"'> 下一页</a></button><button class='btn btn-white btn-sm'><a href='javascript:void(0)' rel='"+totalPage+"'>尾页</a></button></div>"; 
    } 
    $("#pagecount").html(pageStr); 
}