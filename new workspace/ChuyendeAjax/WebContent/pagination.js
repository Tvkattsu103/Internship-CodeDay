$(document).ready(function() {
			var listItem = $('.list-div div');
			var pageItem = $(".dropdown-menu li");
			var prev = $(".pagination li.prev");
			var next = $(".pagination li.next");
			var start = $(".pagination li.start");
			var end = $(".pagination li.end");
			var currentPage = $('.pagination li a span.currentPage');
			var currentPageOfList = $('.pagination li a span.currentPageOfList');
			var pageEnd = $(".dropdown-menu li[end='1']");
			
			var getUrlParameter = function getUrlParameter(sParam) {
			    var sPageURL = window.location.search.substring(1),
			        sURLVariables = sPageURL.split('&'),
			        sParameterName,
			        i;
			    for (i = 0; i < sURLVariables.length; i++) {
			        sParameterName = sURLVariables[i].split('=');
			        if (sParameterName[0] === sParam) {
			            return typeof sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
			        }
			    }
			    return false;
			};
			
			var page = getUrlParameter('page');
			
			if(page == false){
				loadData(1);
			} else {
				loadData(page);
			}
			
			listItem.add(pageItem).hover(function(){
				$(this).addClass('bg-primary');
			}, function() {
				if($(this).attr('id') != 1){
					$(this).removeClass('bg-primary');
				}
			})
			
			listItem.click(function(){
				if($(this).attr('id') != 1){
					listItem.removeAttr('id').removeClass('bg-primary');
					$(this).addClass('bg-primary');
					$(this).attr('id',1);
				}				
			})
			
			pageItem.click(function(){
				var page = $(this).attr('locate');
				loadData(page);
// 				changePage(page);
			})
			
			next.click(function(){
				var page = parseInt(getUrlParameter('page'));
				page += 1;
				loadData(page);
// 				changePage(page);
			})
			
			prev.click(function(){
				var page = parseInt(getUrlParameter('page'));
				page -= 1;
				loadData(page);
// 				changePage(page);
			})
			
			start.click(function(){
				var page = "1";
				loadData(page)
// 				changePage(page);
			})
			end.click(function(){
				var page = $(".dropdown-menu li[end='1']").attr('locate');
				loadData(page);
// 				changePage(page);
			})
			
			function updateUrl(url){
				history.pushState(null, null, url);	
			}
			
			function changePage(page) {
				url = "/ChuyendeAjax/list?page=" + page;
				pageItem.removeAttr('id').removeClass('bg-primary');
				pageItem.each(function(){
					if($(this).attr('locate') == page){
						$(this).addClass('bg-primary');
						$(this).attr('id',1);
						currentPage.text($(this).text());
						currentPageOfList.text($(this).text());
						if($(this).attr('end') == 1){
							start.add(prev).removeClass('disabled');
							end.add(next).addClass('disabled');
						} else if($(this).attr('locate') == 1){
							end.add(next).removeClass('disabled');
							start.add(prev).addClass('disabled');
						} else {
							start.add(prev).removeClass('disabled');
							end.add(next).removeClass('disabled');
						}
					}
				})
				updateUrl(url);
			}
			
			function loadData(page){
				$.ajax({
					url:'/ChuyendeAjax/paging',
					type: 'GET',
					data:{ page:page },
					success: function(data){
						console.log(currentPageOfList.text());
						$('.row.list-phim').html(data);
						changePage(page);

					}
				})
			}
})