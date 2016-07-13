var currentPage;
var qnaCurrentPage;
$(document).ready(function()
{  
	
	$("#minus").on("click", function()
	{
		//alert($("#optionStockError").text());
		if($("#optionStock").val() == 0)
		{
			alert("주문 수량은 1개 이상으로 입력하세요.");
			return false;
		}
		var amount = $("#optionStock").val()
		amount--;
		$("#optionStock").empty().val(amount);
	});
	
	$("#plus").on("click", function()
	{
		if($("#optionStockError").text() == "재고량이 부족합니다.")
			return false;
		if(!$("#optionStockError").text())
		{
			alert("옵션을 선택해 주세요.");
			return false;
		}
		if($("#optionStock").val() == $("#optionStockError").text())
		{
			alert("재고량이 부족합니다.");
			return false;
		}
		var amount = $("#optionStock").val()
		amount++;
		$("#optionStock").empty().val(amount);
	});
	
	$("#optionName").on("change", function()
	{
		var index = this.selectedIndex;
		$.ajax
		({
			"url" : "/HwangDangFleamarket/product/optionStock.go",
			"type" : "POST",
			"data" : {"optionName" : $("#optionName").val(), "productId" : $("#productId").text()},
			"dataType" : "JSON",
			"beforeSend" : function()
			{
				$("#optionStock").empty().val(0);
				$("#error").empty();
				$("#optionAddPriceTr").empty().hide();
				//$("#optionStock").empty().html("<option>수량선택</option>");
				$("#optionNameError").empty();
				$("#optionStockError").empty();
				$("#optionId").empty();
				if(index == 0)
				{
					$("#optionNameError").append("선택할 수 없는 옵션입니다.");
					return false;
				}
			},
			"success" : function(json)
			{
				$("#optionId").append(json.optionId);
				if(json.optionStock == 0)
				{
					$("#optionStockError").append("재고량이 부족합니다.").show();
					$("#optionName option:eq(0)").removeAttr('selected');
					$("#optionName option:eq(0)").attr('selected', 'true');
					return false;
				}
				/* for(var i = json.optionStock; i > 0 ; i--)
				{
					$("#optionStock").append("<option>" + i + "</option>");
				} */
				if(json.optionAddPrice == 0)
				{
					$("#optionStockError").empty().append(json.optionStock).hide();
					return false;
				}
				else
				{
					$("#optionAddPriceTr").html("<td>추가 가격</td><td id='optionAddPrice' name='optionAddPrice'>" + json.optionAddPrice + "원</td>").show();
					$("#optionStockError").empty().append(json.optionStock).hide();
				}
			},		
			"error" : function()
			{
				alert("선택할 수 없는 옵션입니다.");
			}
		});
	});
	
	$("#paging").on("click", "a.previousPage",function()
	{
		//에이잭스 페이징 처리. 이전페이지 눌렀을 때.
		window.currentPage = parseInt($("#paging").children().first().next().text())-1;
		$.ajax(
		{
			"url" : "/HwangDangFleamarket/product/reviewPaging.go",
			"type" : "POST",
			"data" : {"page" : window.currentPage, "productId" : $("#productId").text()},
			"dataType" : "JSON",
			"success" : function(json)
			{
				$("#reviewContent").empty();
				$("#reviewWriter").empty();
				$("#paging").empty();
				for(var i=0; i<json.review.length; i++)
				{
					$("#reviewContent").append(json.review[i].reviewNo + ". " + json.review[i].reviewContent + "<br>");
					$("#reviewWriter").append(json.review[i].reviewWriter + "<br>");
				}
				var endPage = json.bean.endPage
				for(var i=json.bean.beginPage; i<json.bean.endPage+1; i++)
				{
					if(!json.bean.page == i)
					{
						$("#paging").prepend("<a id='currentPage'><b>" + endPage + "</b></a>");
						endPage--;
					}
					else
					{
						$("#paging").prepend("<a class='movePage'> " + endPage + " </a>");
						endPage--;
					}
				}
				if(!json.bean.previousPageGroup)
				{
					$("#paging").prepend("◀");
				}
				else
				{
					$("#paging").prepend("<a class='previousPage'>◀</a>");
				}
				if(!json.bean.nextPageGroup)
				{
					$("#paging").append("▶");
				}
				else
				{
					$("#paging").append("<a class='nextPage'>▶</a>");
				}
			},
			"error" : error
		});
	});
	
	$("#paging").on("click", "a.nextPage",function()
	{
		//에이잭스 페이징 처리. 다음페이지 눌렀을 때.
		window.currentPage = parseInt($("#paging").children().last().prev().text())+1;
		$.ajax(
		{
			"url" : "/HwangDangFleamarket/product/reviewPaging.go",
			"type" : "POST",
			"data" : {"page" : window.currentPage, "productId" : $("#productId").text()},
			"dataType" : "JSON",
			"success" : function(json)
			{
				$("#reviewContent").empty();
				$("#reviewWriter").empty();
				$("#paging").empty();
				for(var i=0; i<json.review.length; i++)
				{
					$("#reviewContent").append(json.review[i].reviewNo + ". " + json.review[i].reviewContent + "<br>");
					$("#reviewWriter").append(json.review[i].reviewWriter + "<br>");
				}
				var endPage = json.bean.endPage;
				for(var i=json.bean.beginPage; i<json.bean.endPage+1; i++)
				{
					if(!json.bean.page == i)
					{
						$("#paging").prepend("<a id='currentPage'><b>" + endPage + "</b></a>");
						endPage--;
					}
					else
					{
						$("#paging").prepend("<a class='movePage'> " + endPage + " </a>");
						endPage--;
					}
				}
				if(!json.bean.previousPageGroup)
				{
					$("#paging").prepend("◀");
				}
				else
				{
					$("#paging").prepend("<a class='previousPage'>◀</a>");
				}
				if(!json.bean.nextPageGroup)
				{
					$("#paging").append("▶");
				}
				else
				{
					$("#paging").append("<a class='nextPage'>▶</a>");
				}
			},
			"error" : error
		});
	});
	
	$("#paging").on("click", "a.movePage",function()
	{
		//에이잭스 페이징 처리. 다른페이지 눌렀을 때.
		window.currentPage = this.text;
		$.ajax(
		{
			"url" : "/HwangDangFleamarket/product/reviewPaging.go",
			"type" : "POST",
			"data" : {"page" : window.currentPage, "productId" : $("#productId").text()},
			"dataType" : "JSON",
			"success" : function(json)
			{
				$("#reviewContent").empty();
				$("#reviewWriter").empty();
				$("#paging").empty();
				for(var i=0; i<json.review.length; i++)
				{
					$("#reviewContent").append(json.review[i].reviewNo + ". " + json.review[i].reviewContent + "<br>");
					$("#reviewWriter").append(json.review[i].reviewWriter + "<br>");
				}
				var endPage = json.bean.endPage;
				for(var i=json.bean.beginPage; i<json.bean.endPage+1; i++)
				{
					if(!json.bean.page == i)
					{
						$("#paging").prepend("<a id='currentPage'><b>" + endPage + "</b></a>");
						endPage--;
					}
					else
					{
						$("#paging").prepend("<a class='movePage'> " + endPage + " </a>");
						endPage--;
					}
				}
				if(!json.bean.previousPageGroup)
				{
					$("#paging").prepend("◀");
				}
				else
				{
					$("#paging").prepend("<a class='previousPage'>◀</a>");
				}
				if(!json.bean.nextPageGroup)
				{
					$("#paging").append("▶");
				}
				else
				{
					$("#paging").append("<a class='nextPage'>▶</a>");
				}
			},
			"error" : error
		});
	});
	
	$("#reviewWrite").on("focus", function()
	{
		if(!'${sessionScope.login_info.memberId}')
		{
			$("#reviewError").empty();
			$("#reviewError").append("로그인 한 회원만 입력 가능합니다.");
			$("#reviewWrite").blur();	
			return false;
		}
		//구매한 상품인지 확인. (+)memberId 세션에서 가져오기
		$.ajax(
		{
			"url" : "/HwangDangFleamarket/product/reviewWriteCheck.go",
			"type" : "POST",
			"data" : "memberId=" + "xx&productId=" + $("#productId").text(),
			"success" : function(text)
			{
				if(!text)
				{
					$("#reviewError").append("해당상품 구매자만 입력 가능합니다.");
					$("#reviewWrite").blur();
				}
			},
			"error" : error,
			"beforeSend" : function()
			{
				$("#reviewError").empty();
			}
		});
	});
	
	$("#reviewRegister").on("click", function()
	{
		//리뷰 등록하기.((+)세션에서 멤버아이디 넘겨주기.) ,,, 추천하기 기능 적용.
		$.ajax(
		{
			"url" : "/HwangDangFleamarket/product/reviewRegister.go",
			"type" : "POST",
			"data" : { "memberId" : "xx", "reviewContent" : $("#reviewWrite").val(), 
						 "productId" : $("#productId").text(), "productLike" : $("input:checked").val()},
			"dataType" : "JSON",
			"beforeSend" : function()
			{
				$("#reviewError").empty();
			 	if($("#reviewWrite").val() == null || $("#reviewWrite").val().trim().length < 3 ||$("#reviewWrite").val().length > 20)
				{
					$("#reviewError").append("3글자 이상, 20자 이하로 입력해주세요.");
					$("#reviewWrite").val("");
					return false;
				}
			},
			"success" : function(json)
			{
				//이미 리뷰가 등록된 경우.
				if(json.productLike == 0)
				{
					$("#reviewError").empty();
					$("#reviewError").append("이미 리뷰를 등록하셨습니다.");
					$("#reviewWrite").val("").blur();
					return false;
				}
				//리뷰 등록 후 리뷰 페이징처리...
				alert("리뷰 등록이 완료되었습니다.");
				$("#like").empty().append("추천 수 : " + json.productLike);
				$("#reviewWrite").val("");
				$("#reviewContent").empty();
				$("#reviewWriter").empty();
				$("#paging").empty();
				for(var i=0; i<json.review.length; i++)
				{
					$("#reviewContent").append(json.review[i].reviewNo + ". " + json.review[i].reviewContent + "<br>");
					$("#reviewWriter").append(json.review[i].reviewWriter + "<br>");
				}
				var endPage = json.bean.endPage;
				for(var i=json.bean.beginPage; i<json.bean.endPage+1; i++)
				{
					if(!json.bean.page == i)
					{
						$("#paging").prepend("<a id='currentPage'><b>" + endPage + "</b></a>");
						endPage--;
					}
					else
					{
						$("#paging").prepend("<a class='movePage'> " + endPage + " </a>");
						endPage--;
					}
				}
				if(!json.bean.previousPageGroup)
				{
					$("#paging").prepend("◀");
				}
				else
				{
					$("#paging").prepend("<a class='previousPage'>◀</a>");
				}
				if(!json.bean.nextPageGroup)
				{
					$("#paging").append("▶");
				}
				else
				{
					$("#paging").append("<a class='nextPage'>▶</a>");
				}
			},
			"error" : error
		});
	});
	
	$("#reviewDelete").on("click", function()
	{
		//리뷰삭제처리 에이잭스 
		$.ajax(
		{
			"url" : "/HwangDangFleamarket/product/reviewDelete.go",
			"type" : "POST",
			"data" : "memberId=xx&productId=" + $("#productId").text(),
			"dataType" : "JSON",
			"beforeSend" : function()
			{
				$("#reviewError").empty();
			},
			"success" : function(json)
			{
				//리뷰 삭제가 안된 경우.
				if(json.reviewDelete == 0)
				{
					$("#reviewError").append("등록된 리뷰가 없습니다.");
					return false;
				}
				if(json.reviewDelete == 3)
				{
					$("#reviewError").append("로그인한 회원만 가능합니다.");
					return false;
				}
				//리뷰 삭제 후 리뷰 페이징처리...
				alert("리뷰 삭제가 완료되었습니다.");
				$("#reviewWrite").val("");
				$("#reviewContent").empty();
				$("#reviewWriter").empty();
				$("#paging").empty();
				for(var i=0; i<json.review.length; i++)
				{
					$("#reviewContent").append(json.review[i].reviewNo + ". " + json.review[i].reviewContent + "<br>");
					$("#reviewWriter").append(json.review[i].reviewWriter + "<br>");
				}
				var endPage = json.bean.endPage;
				for(var i=json.bean.beginPage; i<json.bean.endPage+1; i++)
				{
					if(!json.bean.page == i)
					{
						$("#paging").prepend("<a id='currentPage'><b>" + endPage + "</b></a>");
						endPage--;
					}
					else
					{
						$("#paging").prepend("<a class='movePage'> " + endPage + " </a>");
						endPage--;
					}
				}
				if(!json.bean.previousPageGroup)
				{
					$("#paging").prepend("◀");
				}
				else
				{
					$("#paging").prepend("<a class='previousPage'>◀</a>");
				}
				if(!json.bean.nextPageGroup)
				{
					$("#paging").append("▶");
				}
				else
				{
					$("#paging").append("<a class='nextPage'>▶</a>");
				}
			},
			"error" : function()
			{
				$("#reviewError").append("로그인한 회원만 가능합니다.");
			}
		});
	});
	//aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
	$("#qnaPaging").on("click", "a.qnaPreviousPage",function()
	{
		//에이잭스 페이징 처리. 이전페이지 눌렀을 때.
		window.qnaCurrentPage = parseInt($("#qnaPaging").children().first().next().text())-1;
		$.ajax(
		{
			"url" : "/HwangDangFleamarket/product/qnaPaging.go",
			"type" : "POST",
			"data" : {"page" : window.qnaCurrentPage, "productId" : $("#productId").text()},
			"dataType" : "JSON",
			"success" : function(json)
			{
				$("#qnaError").empty();
				$("#qnaContent").remove();
				$(".qnaTrs").remove();
				$("#qnaPaging").empty();
				for(var i=0; i<json.qna.length; i++)
				{
					$("#qnaTr").before("<tr align='center' class='qnaTrs' id=" + json.qna[i].storeQnANo 
							+"><td width='30'>"+ json.qna[i].storeQnANo 
							+ "</td><td align='center'>" + json.qna[i].storeQnATitle + "</td><td align='center'>" 
							+ json.qna[i].storeQnAWriter + "</td>");
				}
				var endPage = json.qnaBean.endPage
				for(var i=json.qnaBean.beginPage; i<json.qnaBean.endPage+1; i++)
				{
					if(!json.qnaBean.page == i)
					{
						$("#qnaPaging").prepend("<a id='qnaCurrentPage'><b>" + endPage + "</b></a>");
						endPage--;
					}
					else
					{
						$("#qnaPaging").prepend("<a class='qnaMovePage'> " + endPage + " </a>");
						endPage--;
					}
				}
				if(!json.qnaBean.previousPageGroup)
				{
					$("#qnaPaging").prepend("◀");
				}
				else
				{
					$("#qnaPaging").prepend("<a class='qnaPreviousPage'>◀</a>");
				}
				if(!json.qnaBean.nextPageGroup)
				{
					$("#qnaPaging").append("▶");
				}
				else
				{
					$("#qnaPaging").append("<a class='qnaNextPage'>▶</a>");
				}
			},
			"error" : error
		});
	});
	
	$("#qnaPaging").on("click", "a.qnaNextPage",function()
	{
		//에이잭스 페이징 처리. 다음페이지 눌렀을 때.
		window.qnaCurrentPage = parseInt($("#qnaPaging").children().last().prev().text())+1;
		$.ajax(
		{
			"url" : "/HwangDangFleamarket/product/qnaPaging.go",
			"type" : "POST",
			"data" : {"page" : window.qnaCurrentPage, "productId" : $("#productId").text()},
			"dataType" : "JSON",
			"success" : function(json)
			{
				$("#qnaError").empty();
				$("#qnaContent").remove();
				$(".qnaTrs").remove();
				$("#qnaPaging").empty();
				for(var i=0; i<json.qna.length; i++)
				{
					$("#qnaTr").before("<tr align='center' class='qnaTrs' id=" + json.qna[i].storeQnANo 
							+"><td width='30'>"+ json.qna[i].storeQnANo 
							+ "</td><td align='center'>" + json.qna[i].storeQnATitle + "</td><td align='center'>" 
							+ json.qna[i].storeQnAWriter + "</td>");
				}
				var endPage = json.qnaBean.endPage;
				for(var i=json.qnaBean.beginPage; i<json.qnaBean.endPage+1; i++)
				{
					if(!json.qnaBean.page == i)
					{
						$("#qnaPaging").prepend("<a id='qnaCurrentPage'><b>" + endPage + "</b></a>");
						endPage--;
					}
					else
					{
						$("#qnaPaging").prepend("<a class='qnaMovePage'> " + endPage + " </a>");
						endPage--;
					}
				}
				if(!json.qnaBean.previousPageGroup)
				{
					$("#qnaPaging").prepend("◀");
				}
				else
				{
					$("#qnaPaging").prepend("<a class='qnaPreviousPage'>◀</a>");
				}
				if(!json.qnaBean.nextPageGroup)
				{
					$("#qnaPaging").append("▶");
				}
				else
				{
					$("#qnaPaging").append("<a class='qnaNextPage'>▶</a>");
				}
			},
			"error" : error
		});
	});
	
	$("#qnaPaging").on("click", "a.qnaMovePage",function()
	{
		//에이잭스 페이징 처리. 다른페이지 눌렀을 때.
		window.qnaCurrentPage = this.text;
		$.ajax(
		{
			"url" : "/HwangDangFleamarket/product/qnaPaging.go",
			"type" : "POST",
			"data" : {"page" : window.qnaCurrentPage, "productId" : $("#productId").text()},
			"dataType" : "JSON",
			"success" : function(json)
			{
				$("#qnaError").empty();
				$("#qnaContent").remove();
				$(".qnaTrs").remove();
				$("#qnaPaging").empty();
				for(var i=0; i<json.qna.length; i++)
				{
					$("#qnaTr").before("<tr align='center' class='qnaTrs' id=" + json.qna[i].storeQnANo 
							+"><td width='30'>"+ json.qna[i].storeQnANo 
							+ "</td><td align='center'>" + json.qna[i].storeQnATitle + "</td><td align='center'>" 
							+ json.qna[i].storeQnAWriter + "</td>");
				}
				var endPage = json.qnaBean.endPage;
				for(var i=json.qnaBean.beginPage; i<json.qnaBean.endPage+1; i++)
				{
					if(!json.qnaBean.page == i)
					{
						$("#qnaPaging").prepend("<a id='qnaCurrentPage'><b>" + endPage + "</b></a>");
						endPage--;
					}
					else
					{
						$("#qnaPaging").prepend("<a class='qnaMovePage'> " + endPage + " </a>");
						endPage--;
					}
				}
				if(!json.qnaBean.previousPageGroup)
				{
					$("#qnaPaging").prepend("◀");
				}
				else
				{
					$("#qnaPaging").prepend("<a class='qnaPreviousPage'>◀</a>");
				}
				if(!json.qnaBean.nextPageGroup)
				{
					$("#qnaPaging").append("▶");
				}
				else
				{
					$("#qnaPaging").append("<a class='qnaNextPage'>▶</a>");
				}
			},
			"error" : error
		});
	});
	
	//문의 클릭했을 경우.
	$("#qnaTable").on("click", "tr.qnaTrs", function()
	{
		$("#qnaError").empty();
		$("#qnaTable tr").css("background-color", "white");
		$(this).css("background-color", "#FFFED7");
		var no = $(this).children().first().text();
		$.ajax(
		{
			"url" : "/HwangDangFleamarket/product/qnaShow.go",
			"type" : "POST",
			"data" : {"storeQnANo" : no, "sellerStoreNo" : '${param.sellerStoreNo}'},
			"dataType" : "JSON",
			"beforeSend" : function()
			{
				$("#qnaContent").remove();
			},
			"success" : function(json)
			{
				if(json.storeQnAPublished == 3)
				{
					//비공개인 경우.
					$("#"+no).after("<tr id='qnaContent'><td></td><td colspan='2'>비공개 문의 입니다.</td></tr>");
					return false;
				}
				else
				{
					//공개인 경우.
					if(!json.storeQnAReply)
					{
						//댓글이 달려있지 않은 경우.
						var content = json.storeQnAContent;
						for(var i = 0; i < content.length; i++)
						{
							content = content.replace(">", "&gt;");
							content = content.replace("<", "&lt;");
						}
						for(var i = 0; i < content.length; i++)
						{
							content = content.replace("\n", "<br>");
							content = content.replace(" ", "&nbsp;");
						}
						$("#"+no).after("<tr id='qnaContent'><td colspan='3'>문의 내용 : " + content 
								+  "<br><br><input type='text' id='qnaReply' size='65'><input type='button' id='qnaReplyRegister' value='답변하기.'></td></tr>");
						//답변하기 버튼클릭.
						$("#qnaReplyRegister").on("click", function()
						{
							$.ajax(
							{
								"url" : "/HwangDangFleamarket/product/qnaReplyRegister.go",
								"type" : "POST",
								"data" : {"sellerStoreNo" : '${param.sellerStoreNo}', "storeReplyContent" : $("#qnaReply").val(), "storeQnANo" : no},
								"dataType" : "JSON",
								"beforeSend" : function()
								{
									if($("#qnaReply").val() == null || $("#qnaReply").val().trim().length < 3)
									{
										$("#qnaReply").val("3글자 이상 입력해 주세요.").focus();
										return false;
									}
								},
								"success" : function(jsons)
								{
									var content = jsons.storeQnAContent;
									for(var i = 0; i < content.length; i++)
									{
										content = content.replace(">", "&gt;");
										content = content.replace("<", "&lt;");
									}
									for(var i = 0; i < content.length; i++)
									{
										content = content.replace("\n", "<br>");
										content = content.replace(" ", "&nbsp;");
									}
									var replyContent = jsons.storeQnAReply.storeReplyContent;
									for(var i = 0; i < replyContent.length; i++)
									{
										replyContent = replyContent.replace(">", "&gt;");
										replyContent = replyContent.replace("<", "&lt;");
									}
									for(var i = 0; i < replyContent.length; i++)
									{
										replyContent = replyContent.replace("\n", "<br>");
										replyContent = replyContent.replace(" ", "&nbsp;");
									}
									alert("문의답변이 완료되었습니다.");
									$("#qnaContent").empty();
									$("#qnaContent").append("<td></td><td>문의 내용 : " + content 
											+  "<br><hr>문의 답변 : " + replyContent + "</td>"
											+ "<td align='center'><input type='button' id='qnaReplyRemove' value='삭제하기'></td>");
									return false;
								},
								"error" : function()
								{
									$("#qnaReply").val("해당상품 판매자만 입력 가능합니다.").blur();
									$("#qnaReply").attr("readonly", "readonly");
								}
							});
						});
					}
					else
					{
						//댓글 달려있는 경우.
						var content = json.storeQnAContent;
						var replyContent = json.storeQnAReply.storeReplyContent;
						for(var i = 0; i < content.length; i++)
						{
							replyContent = replyContent.replace(">", "&gt;");
							replyContent = replyContent.replace("<", "&lt;");
						}
						for(var i = 0; i < content.length; i++)
						{
							content = content.replace("\n", "<br>");
							content = content.replace(" ", "&nbsp;");
						}
						for(var i = 0; i < replyContent.length; i++)
						{
							replyContent = replyContent.replace(">", "&gt;");
							replyContent = replyContent.replace("<", "&lt;");
						}
						for(var i = 0; i < replyContent.length; i++)
						{
							replyContent = replyContent.replace("\n", "<br>");
							replyContent = replyContent.replace(" ", "&nbsp;");
						}
						$("#"+no).after("<tr id='qnaContent'><td></td><td>문의 내용 : " + content 
								+  "<br><hr>문의 답변 : " + replyContent + "</td><td align='center'><input type='button' id='qnaRemove' value='삭제하기'></td></tr>");
						$("#qnaRemove").on("click", function()
						{
							$.ajax(
							{
								//삭제하기 버튼 클릭시...
								"url" : "/HwangDangFleamarket/storeQnA/storeQnARemove.go",
								"type" : "POST",
								"data" : {"sellerStoreNo" : '${param.sellerStoreNo}', "storeQnANo" : no, "memberId" : "xx", "productId" : $("#productId").text()},
								"dataType" : "JSON",
								"beforeSend" : function()
								{
									$("#qnaError").empty();
								},
								"success" : function(json)
								{
									if(json.result != null)
										alert("삭제가 완료되었습니다.");
									else
									{
										$("#qnaError").append("작성자와 판매자만 삭제 가능합니다.");
										return false;
									}
									$("#qnaContent").remove();
									$(".qnaTrs").remove();
									$("#qnaPaging").empty();
									for(var i=0; i<json.qna.length; i++)
									{
										$("#qnaTr").before("<tr align='center' class='qnaTrs' id=" + json.qna[i].storeQnANo 
												+"><td width='30'>"+ json.qna[i].storeQnANo 
												+ "</td><td align='center'>" + json.qna[i].storeQnATitle + "</td><td align='center'>" 
												+ json.qna[i].storeQnAWriter + "</td>");
									}
									var endPage = json.qnaBean.endPage;
									for(var i=json.qnaBean.beginPage; i<json.qnaBean.endPage+1; i++)
									{
										if(!json.qnaBean.page == i)
										{
											$("#qnaPaging").prepend("<a id='qnaCurrentPage'><b>" + endPage + "</b></a>");
											endPage--;
										}
										else
										{
											$("#qnaPaging").prepend("<a class='qnaMovePage'>" + endPage + "</a>");
											endPage--;
										}
									}
									if(!json.qnaBean.previousPageGroup)
									{
										$("#qnaPaging").prepend("◀");
									}
									else
									{
										$("#qnaPaging").prepend("<a class='qnaPreviousPage'>◀</a>");
									}
									if(!json.qnaBean.nextPageGroup)
									{
										$("#qnaPaging").append("▶");
									}
									else
									{
										$("#qnaPaging").append("<a class='qnaNextPage'>▶</a>");
									}
								},
								"error" : function()
								{
									$("#qnaError").append("로그인이 필요한 서비스입니다.");
								}
							});
						});
					}
				}
			},
			"error" : function()
			{
				$("#"+no).after("<tr id='qnaContent'><td></td><td colspan='2'>로그인이 필요합니다.</td></tr>");
			}
		});
	});
	$("#cartLayer").hide();
	$("#cartBtn").on("click", function(){
		var productId = $("#productId").text();
		if(!'${sessionScope.login_info.memberId}')
		{
			var result = confirm("로그인이 필요한 서비스입니다.\n로그인하시겠습니까?");
			if(result){
				return window.open('/HwangDangFleamarket/member/login.go', '로그인창', 'resizable=no scrollbars=yes width=700 height=450 left=500 top=200');
			}else{
				return false;
			}
		}
		$.ajax({
			"url":"/HwangDangFleamarket/cart/addCart.go",
			"type":"POST",
			"data":{
					//"productName": "${ requestScope.product.productName }",
					//"productPrice": "${ requestScope.product.productPrice }",
					"cartProductAmount": $("#optionStock").val(),
					"cartProductOption": $("#optionName option:selected").val(),
					"sellerStoreName":"${requestScope.product.seller.sellerStoreName}",
					"memberId":"${sessionScope.login_info.memberId}",
					"productId":"${ requestScope.product.productId }",
					"optionId":$('#optionId').text()
					},
			"dataType":"json",
			"beforeSend":function(){
				if($("#optionName option:selected").val() == "${requestScope.optionList[0].optionName}"){// 이게 첫번째 인덱스면 경고창
					alert("옵션을 선택해주세요.");
					return false;
				}
				if($("#optionStock").val() == 0){
					alert("수량을 선택해주세요.");
					return false;
				}
			},
			"success":function(){
				$("#cartLayer").dialog({
					resizable: false,
				    height:150,
			  		"modal":true,
			  		buttons: {
			  	        "장바구니로": function() {
			  	         location.href = "/HwangDangFleamarket/cart/cartList.go?memberId=${sessionScope.login_info.memberId}";
			  	        },
			  	        "계속쇼핑": function() {
			  	          $( this ).dialog( "close" );
			  	        }
			  	      }
			  	});
			},
			"error":error
		});
	});
	
	//바로구매 
	$("#buyBtn").on("click",function(){
		var amount = $("#optionStock").val();
		//alert("재고량:"+amount);
		 var option = $("#optionName option:selected").val();
		 $("form").prop("action","/HwangDangFleamarket/buy/moveBuyPage.go?page=${param.page}&productId=${param.productId }&sellerStoreNo=${param.sellerStoreNo}&sellerStoreImage=${param.sellerStoreImage}&amount="+amount+"&memberId=${sessionScope.login_info.memberId}&option="+option );
		 $("form").submit();
	}); //btn 
	$('#deleteBtn').on("click", function(){
		if(!confirm("이 상품을 정말 삭제하시겠습니까?")){
			return false;
		}else{
			location.href='/HwangDangFleamarket/product/deleteProduct.go?page=${param.page}&sellerStoreNo=${param.sellerStoreNo}&sellerStoreImage=${ param.sellerStoreImage }&productId=${ requestScope.product.productId }'
		}
	});
}); //reday

function error(xhr, status, err)
{
	alert(status+", "+xhr.readyState+" "+err);
}