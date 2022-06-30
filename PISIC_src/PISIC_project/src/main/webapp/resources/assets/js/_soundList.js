$(function(){
	/* modal 플레이 리스트 담기 */
	$("#select_insert").click(function() {
		$("#playlist_insert_modal").show();
		$.ajax({
		url: "<%=request.getContextPath()%>/mymusic/playlist.ax",
		type: "post",
		dataType: "json",
		success: function(result) {
			var html = "";
			for (var i = 0; i < result.length; i++) {
				var vo = result[i];
				html += '<tr>';
				html += '<td><img src="${pageContext.request.contextPath}/resources/icons/receive.png" width="20" height="20"></td>';
				html += '<td>' + vo.alarm_sendid + '</td>';
				html += '<td>' + vo.alarm_date + '</td>';
				html += '</tr>';
			}
			$("#receive_alarm_table_tr1").nextAll().remove();
			$("#receive_alarm_table").append(html);
		},
	});
	});
	
	$(".playlist_insert_modal_close").click(function() {
		$("#playlist_insert_modal").hide();
	});
	
	playlist_insert_modal.addEventListener("click", e => {
		const evTarget = e.target
		if (evTarget.classList.contains("playlist_insert_modal_overlay")) {
			$("#playlist_insert_modal").hide();
		}
	});
});
