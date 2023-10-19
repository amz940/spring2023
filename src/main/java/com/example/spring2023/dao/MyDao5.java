package com.example.spring2023.dao;

import com.example.spring2023.domain.MyDto36;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface MyDao5 {

    @Select("""
        <script>
            SELECT COUNT(*)
            FROM customers

            <if test='country != null'>
            WHERE country = #{country}
            </if>
        </script>
    """)
    String select1(String country);

    @Select("""
        <script>
            SELECT CustomerName FROM customers
            
            -- if문안엔 쓸때 #{}를 안쓰고 바로 이름을 적는다
            <if test='num == 10'>
                -- 수가 10이다
            </if>
            
            <if test='num != 10'>
                -- 수가 10이 아니다
            </if>
            <if test='num > 10'>
                -- 수가 10보다 크다
            </if>
            <if test='num lt 10'>
                -- 수가 10보다 작다
            </if>
            <if test='num >= 10'>
                -- 수가 10보다 크거나 같다
            </if>
            <if test='num lte 10'>
                -- lte
                -- 수가 10보다 작거나 같다.
            </if>
        </script>
    """)
    List<String> select2(Integer num);

@Select("""
    <script>
        SELECT CustomerName, ContactName
        FROM customers
        
        <if test='code == 1'>
            WHERE customerName
        </if>
        
        <if test='code == 2'>
            WHERE contactName
        </if>
        
            LIKE #{k}
    </script>
""")
    List<Map<String, Object>> select3(Integer code, String k);

    @Select("""
        <script>
            SELECT COUNT(*) FROM customers
            WHERE
                <if test='i gt 10'>
                -- i가 10보다 큼
                </if>
                <if test='i lt 10'>
                -- i가 10보다 작음
                </if>
                <if test='(i gt 0) and (i lt 100)'>
                -- i가 0보다 크고 100보다 작음
                </if>
        </script>
            """)
    String select4(int i);
    // 정적인 쿼리
    // 정적 쿼리 안에선 등호 사용 가능
    @Select("""
        SELECT *
        FROM customers
        WHERE CustomerName > 'a';
    """)
    void select5();
    // 동적인 쿼리 안에서는 등호 사용 불가능
    // CDATA : <![CDATA[ ]]>
    // -> CDATA[] 안에 들어가 있는 코드들을 전부 문자로만 읽어라, 마크업 코드로 해석하지 마라
    @Select("""
        <script>
            <![CDATA[
                SELECT *
                FROM customers
                WHERE CustomerName < 'a';
            ]]>
        </script>
            """)
    String select6();

    @Select("""
        <script>
            SELECT *
            FROM customers
            WHERE Country IN (
                    <foreach collection="args" 
                            item="elem" separator=", ">
                        #{elem}
                    </foreach>
            )
        </script>
            """)
    String select7(List args);

    @Select("""
        <script>
            SELECT *
            FROM customers
                <trim prefix="WHERE" prefixOverrides="OR">
                    <foreach collection="args"
                             item="elem">
                        OR country = #{elem}
                     </foreach>
                 </trim>
         </script>
            """)
    String select8(List args);


    // bind : 묶다
    @Select("""
        <script>
            <bind name ="alterKeyword" value =" '%' + keyword + '%' " />
            SELECT *
            FROM customers
            WHERE CustomerName LIKE #{alterKeyword}
        </script>
        """)
    String select9(String keyword);

    @Select("""
<script>
    SELECT * FROM customers
    WHERE 
        <if test=" word == 'abc' ">
            -- word는 abc
        </if>
        <if test=' word == "def" '>
            -- word는 def
        </if>
        <if test="word == 'q'">
            -- word는 q, 이 코드는 작동안됨
        </if>
        <if test='word == "k"'>
            -- word는 k, 윗 코드를 삭제해야 이 코드가 작동됨
        </if>
</script>
""")
    // 'q' 와 "z" 같이 한글자일 경우 String인지, character인지 알 수 없어 익셉션 발생
    // 안쪽에서 " " 썻기 때문에 바깥쪽에 ' ' 써야한다
    // ' "z" ' 로 쓰자
    String select10(String keyword);

    @Select("""
            SELECT DISTINCT City
            FROM customers
            WHERE City IS NOT NULL AND city != ''
            ORDER BY 1
            """)
    List<String> listCustomerCity();

    @Select("""
            SELECT DISTINCT Country
            FROM customers
            WHERE Country IS NOT NULL AND Country !=''
            ORDER BY 1
            """)
    List<String> listCustomerCountry();

    @Select("""
            <script>
                SELECT CustomerName name, City, Country
                FROM customers
                    <trim prefix="WHERE">
                        <if test='type == "1"'>
                            city
                            <foreach collection="city" item="elem" open=" IN ("
                                     separator="," close= ")">
                                     #{elem}
                             </foreach>
                        </if>
                        <if test='type == "2"'>
                            country
                            <foreach collection="country" item="elem" open=" IN("
                                     separator="," close=")">
                                     #{elem}
                             </foreach>
                        </if>
                    </trim>
                ORDER BY name, Country, City
            </script>
            """)
    List<Map<String,Object>> listCustomer(MyDto36 dto);
}
