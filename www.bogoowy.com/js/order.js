 function IsMobile(phone) {
            if (/^1[34578]{1}\d{9}$/.test(phone)) {
                return true;
            } else {
                return false;
            }
        }

        $(document).ready(function () {
			new PCAS("province","city","area");
									
            $('form').submit(function () {
                //alert($(this).serialize());
                var strError = ""; 
                var productName2 = $('input:radio[name="product"]:checked').val();
                var userName2 = $("input[name='name']").val();//$("#name").val();
                var payWay2 = $('input:radio[name="pay"]:checked').val();
                var userMobile2 = $("input[name='mob']").val();//$("#mob").val();
                var userAddress2 =  $("select[name='province']").val() +  $("select[name='city']").val() +  $("select[name='area']").val() +  $("input[name='address']").val();//$("#province").val() + $("#city").val() + $("#area").val() + $("#address").val();
                var userContext2 = "附加属性：属相" + $('input:radio[name="chanpin1"]:checked').val() + "，订购数量：" + $("input[name='mun']").val()+ "，订购价格：" + $("input[name='price']").val()+ "，客户留言：" + $("textarea[name='guest']").val();
                var FormSite2 = window.location.host;
                if (productName2 == "" || productName2 == undefined || productName2==null)
                    strError = strError + "产品不能为空！";
                if (userName2 == "" || userName2 == undefined || userName2 == null)
                    strError = strError + "客户姓名不能为空！";
                if (userMobile2 == "" || userMobile2 == undefined || userMobile2 == null)
                    strError = strError + "客户手机号不能为空！";               
                if (!IsMobile(userMobile2))
                    strError = strError + "错误的客户手机号！";
                if (userAddress2 == "" || userAddress2 == undefined || userAddress2 == null)
                    strError = strError + "客户地址不能为空！";

                if (strError != "") {
                    alert(strError);
                    return false;
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "http://116.255.238.183:88/WapToDB.ashx",
                        data: { productName: productName2, userName: userName2, payWay: payWay2, userMobile: userMobile2, userAddress: userAddress2, userContext: userContext2, FormSite: FormSite2 },
                        async: false,
                        success: function (data) {
                            if (data.IsSuccess) {
                                //$('#MobileNo').validationEngine('showPrompt', data.Message, 'pass');
                                alert("提交成功！");
								
								//var path="";
								//if(payWay2=="微信付款")
								//{
								//	path="wx"+productName2+".png";
								//}
								//else
								//{
								//	path="alipay"+productName2+".jpg";
								//}
								//$("#imgPay").attr("src",path);
								//$("#showPay").show();
                            }
                            else {
                                alert(data.Message);
                            }
                        }
                    });
                }
                return false;
            });
        });