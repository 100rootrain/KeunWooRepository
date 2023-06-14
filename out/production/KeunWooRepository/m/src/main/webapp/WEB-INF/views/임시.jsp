	<div>
		<div>
			<c:forEach var="i" begin="1" end="${(cnt/rows)+1}" step="1" varStatus="status">
				<span class="page"
					<%-- c:if : test의 조건에 따라 해당 부분을 표시  --%>
						<c:if test="${page eq i}">
    						style="color:red; font-weight:bold"
						</c:if>
					onclick="fnSearch(${i}); return false;">${i}</span>
			</c:forEach>
			
			
			
			
			
			
			<select id="rows">
				<option <c:if test="${rows eq 3}">
							selected
						</c:if>
					value="3">3</option>
				<option <c:if test="${rows eq 5}">
							selected
						</c:if>
					value="5">5</option>
				<option <c:if test="${rows eq 10}">
							selected
						</c:if>
					value="10">10</option>
			</select>
		</div>
	</div>