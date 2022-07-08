<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="playlist_insert_modal" class="playlist_insert_modal_overlay">
	<div
		class="col-md-8 grid-margin stretch-card playlist_insert_modal_window">
		<div class="card playlist_insert_modal">
			<div class="card-body">
				<div class="d-flex flex-row justify-content-between">
					<h3 class="card-title mb-1">내 플레이 리스트에 담기</h3>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="preview-list">
							<div
								class="preview-item-content d-sm-flex flex-grow playlist_insert_modal_content">
								<div class="flex-grow playlist_insert_modal_new">
									<h5 class="preview-subject">
										<c:choose>
											<c:when test="${empty loginSsInfo}">
												<a href="javascript:goLogin()">로그인 후 이용해주세요.</a>
											</c:when>
											<c:when test="${not empty loginSsInfo}">
												<a href="javascript:newPlaylist()"> + 새 플레이 리스트 만들기</a>
											</c:when>
										</c:choose>
									</h5>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
