function _init(){
      var _thFileName,_thFileSize,_thFileOpr;
      var _fileSize;
      var _fileList=[];
      var _fileIndex=1;
      $(".albumTabs").jqtabUI();
      
      $(".image").bind("mouseenter",function(){
        $(this).attr("class","image_hover");
      });
      
      $(".image").bind("mouseleave",function(){
        $(this).attr("class","image");
      });
      
      $(".albumItem").bind("mouseenter",function(){
        $(this).find("#albumOpr").attr("class","show");
      });
      
      $(".albumItem").bind("mouseleave",function(){
        $(this).find("#albumOpr").attr("class","hide");
      });
      
      $('#image a').lightBox();
      
      $(".selectFile").bind("change",function(){
            _addFile($("#multiFiles"), this);
            _fileList[0]=this;
            //alert(this.value);
            //this.setAttribute("class","");
            //$("#files").append(this);
            $(".continueSelect").css("display","block");
            $(this).css("display","none");
            this.parentNode.setAttribute("id","continueSelectFile");
      });
      
      $(".continueSelect").bind("change",function(){
            var _table=document.getElementById("multiFileList");
            _fileList[_fileIndex]=this;
            _fileIndex+=1;
            console.log(_fileList[0].value);
            var _fileName=this.value;
            var _fileSize=_getFileSize(this)/1000+"kb";
            var _tr=_createFileItem(_fileName,_fileSize);
            _appendChilds(_table,[_tr]);
      })
      
      $("#upload_photo_photoURL").change(checkFileType);
      
}

//创建一个table的头，其中包含一个文件元素
function _addFile(_parent, _fileItem){
      var _table = _createElement("table", "multiFileList", "");
      //创建table的标题行
      _thFileName=_createElement("th", "", "文件名");
      _thSize=_createElement("th", "", "文件大小");;
      _thOpr=_createElement("th", "", "删除文件");
      _tr=_createElement("tr","","");
      //将文件元素添加到tr元素中
      _appendChilds(_tr,[_thFileName,_thSize,_thOpr]);
      _appendChilds(_table, [_tr]);
      var _trFileItem=_createFileItem(_fileItem.value,_getFileSize(_fileItem)/1000+"kb");
      _appendChilds(_table, [_trFileItem]);
      _parent.append(_table);
}

//创建一个file列表元素，包含文件名、文件大小和操作，返回值是一个tr元素
function _createFileItem(_fileName,_fileSize){
      _tdFileName=_createElement("td","",_fileName);
      _tdFileSize=_createElement("td","",_fileSize);
      _tdFileOpr=_createElement("td","delFile","删除");
      $(_tdFileOpr).bind("click",function(){
            $(this).parent().remove();
      });
      _tr=_createElement("tr","","");
      _appendChilds(_tr,[_tdFileName,_tdFileSize,_tdFileOpr]);
      return _tr;
}

//为_parent添加多个子元素，_childList为一个数组
function _appendChilds(_parent, _childList){
      var _length=_childList.length;
      for(var i = 0; i<_length; i++){
            _parent.appendChild(_childList[i]);
      }
}

//创建并返回一个指定类型的DOM元素
function _createElement(_elemType, _idName, _innerHTML){
      var _elem = document.createElement(_elemType);
      if(_idName!=null || _idName!="" || _idNanme!=undefined){
            _elem.setAttribute("id",_idName);
      }
      if(_innerHTML!=null || _innerHTML!="" || _innerHTML!=undefined){
            _elem.innerHTML = _innerHTML;
      }
      return _elem;
}

function _getFileSize(_file){
      
      var ie=!-[1,];   //区分ie

      if(ie){
      
            var img=new Image();//动态创建img
      
            img.src=_file;
            
            img.style.display="none";
            
            img.onreadystatechange=function(){
            
                  if(img.readyState=='complete'){//当图片load完毕
                  
                        _fileSize = img.fileSize;//ie获取文件大小
      
                   }
      
            }
      
            document.body.removeChlid(img);//获取大小结束，移除图片
      
      }
      
      else{
            _fileSize=_file.files[0].size;//火狐等标准取值办法
      
      }
      return _fileSize;
}

function checkFileType(){
      var form = document.getElementById("new_upload_photo");
      if(!(this.value).match(/.jpg|.gif|.png/)){
            alert("必须是图像文件");
            form.onsubmit = function(){return false;};
      }else{
            form.onsubmit = function(){return true;};
      }
}