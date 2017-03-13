$(document).ready(function(){
		scrollComment();
	});

	//评论滚动
	var scrollComment = function(){
		var comment = $(".comment");
		var box = $(".comment-inner");
		var boxClone = box.clone(false);
		comment.append(boxClone);

		setInterval(function(){
			if (boxClone[0].offsetHeight - comment[0].scrollTop <= 0) {
	            comment[0].scrollTop -= box[0].offsetHeight;
	        } else {
	            comment[0].scrollTop++;
	        }
		},40)
	}

	var loadImage = function(){
		var src = $(".banner-item img").attr("src");
		var img = new Image();
		var flag = true;
		img.onload = function(){
			loadImages();
		}
		img.onerror = function(){
			loadImages();
		}
		setTimeout(function(){
			loadImages();
		},1500);
		var loadImages = function(){
			if(flag){
				flag = false;
				$(".lazy-img").each(function(){
					var $ele = $(this);
					$ele.attr({'src':$ele.attr("data-src")});
				});
			}
		}
		img.src = src;
	}

// 倒计时的地方

function mg3(id){
max=2172;  //倒计时秒数
var acookie=document.cookie.split("; ");
function getck(sname)
{	
	//获取单个cookies
	for(var i=0;i<acookie.length;i++)
	{
		var arr=acookie[i].split("=");
		if(sname==arr[0])
		{
			if(arr.length>1)
				return unescape(arr[1]);
			else
				return "";
		}
	}
	return "";
}
function setenddate()
{	
	var enterdate = new Date();
	var exp  = new Date();
	exp.setTime(exp.getTime() + max*1000);  //cookie过期时间为当前时间+max秒
	document.cookie = "enterdate" + "="+ escape(enterdate) + ";expires=" + exp.toGMTString();  //保存进入时间
	document.cookie = "enddate" + "="+ escape(exp) + ";exp=" + exp.toGMTString();  //保存结束时间
}
if(!getck("enterdate"))
{
	setenddate();
	addTimeLesser(id, max);
}
else
{
	var date1=new Date();  //当前时间
	var date2=new Date(getck("enddate"));    //结束时间
	var remain=(date2.getTime()-date1.getTime())/1000;  //剩余时间
	if (remain>max)
	{
		setenddate();
		addTimeLesser(id, max);
	}
	else
	{
		addTimeLesser(id, remain);
	}
}
}
mg3(1);
mg3(2);
