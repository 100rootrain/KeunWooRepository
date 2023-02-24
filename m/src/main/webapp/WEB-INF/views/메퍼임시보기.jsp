 <select id="getBulletinBoardList" parameterType="map"
      resultType="map">
      SELECT *
      FROM (SELECT ROWNUM RN, M.*
      FROM ( SELECT
      NO,TITLE,CONTENTS,REG_USER,REG_DATE FROM TB_BULLETIN_BOARD WHERE 1=1
      <if test="txt != ''">
         <if test="type == 'type_Name' ">
            AND TITLE LIKE '%'||'${txt}'||'%'
         </if>
         <if test="type == 'type_User'">
            AND REG_USER LIKE '%'||'${txt}'||'%'
         </if>

      </if>

      <if test="start != '' and end == ''">
         AND REG_DATE >= '${start}'
      </if>

      <if test="start =='' and end !=''">
         AND REG_DATE &lt;= '${end}'
      </if>

      <if test="start != '' and end != ''">
         AND REG_DATE BETWEEN '${start}' AND '${end}'
      </if>

      ORDER BY NO DESC

      ) M)
      WHERE RN BETWEEN (('${page}' - 1) * '${rows}') + 1
      AND
      ('${page}' * '${rows}')

   </select> 
