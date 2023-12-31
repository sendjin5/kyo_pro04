<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/admin/template/header.jsp"></jsp:include>

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script>
    window.onload = function () {

        var chart = new CanvasJS.Chart("member_count", {
            animationEnabled: true,
            title:{
                text: "Monthly member count"
            },
            axisY: {
                title: "가입자 수",
                valueFormatString: "###,###,###,###",
                suffix: "명"
            },
            data: [{
                type: "splineArea",
                color: "rgba(255,152,163,.7)",
                markerSize: 10,
                xValueFormatString: "MM월",
                yValueFormatString: "###,###,###,###",
                dataPoints: [
                    <c:forEach var="member_monthly_count" items="${member_monthly_count}">
                    { x: new Date('${member_monthly_count.monthly}'), y: ${member_monthly_count.count}} ,
                    </c:forEach>]
            }]
        } );

        var chart1 = new CanvasJS.Chart("seller_count", {
            animationEnabled: true,
            title:{
                text: "Monthly seller count"
            },
            axisY: {
                title: "가입자 수",
                valueFormatString: "###,###,###,###",
                suffix: "명"
            },
            data: [{
                type: "splineArea",
                color: "rgba(130,179,237,.7)",
                markerSize: 10,
                xValueFormatString: "MM월",
                yValueFormatString:  "###,###,###,###",
                dataPoints: [
                    <c:forEach var="seller_monthly_count" items="${seller_monthly_count}">
                    { x: new Date('${seller_monthly_count.monthly}'), y: ${seller_monthly_count.count}} ,
                    </c:forEach>]
            }]
        });

        var chart2 = new CanvasJS.Chart("hotel_price", {
            animationEnabled: true,
            title:{
                text: "Monthly hotel price"
            },
            axisY: {
                title: "총 매출 액",
                valueFormatString: "\###,###,###,##0.##",
                suffix: "원"
            },
            data: [{
                type: "splineArea",
                color: "rgba(110,110,110,.7)",
                markerSize: 5,
                xValueFormatString: "MM월",
                yValueFormatString: "\#,##0.##",
                dataPoints: [
                    <c:forEach var="reserve_total" items="${reserve_total}">
                    { x: new Date('${reserve_total.monthly}'), y: ${reserve_total.total}} ,
                    </c:forEach>
                ]
            }]
        });

        chart.render();
        chart1.render();
        chart2.render();
    }
</script>

<style>
    .admin_count_table {
        color:black;
    }

    .empty {
        height:100px;
    }

    .admin_count_table{
        border-top: 3px solid #432c10;
        border-bottom: 3px solid #432c10;
        border-left: none;
        border-right: none;
    }

    .admin_count_table thead tr th {
        font-size: 28px;
    }

    .stripe > tbody > tr:nth-child(2n-1){
        background-color : #c9d6de;
    }

</style>

<div class="empty"></div>

<div>
    <div style="display: inline-block; width: 49%; text-align: right;">
        <table class="admin_count_table"  style="margin-left: 350px">
            <thead>
            <tr>
                <th colspan="2", style="padding:10px;">
                    &emsp;[ 회원 가입 수 ]&emsp;
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>전체 회원 수</td>
                <td align="right">${member_total_count}명</td>
            </tr>
            <tr>
                <td>최근 7일 가입 회원 수</td>
                <td align="right">${recent_member_count}명</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div style="display: inline-block; width: 49%; text-align: right;">
        <table class="admin_count_table" style="margin-left: 320px">
            <thead>
            <tr>
                <th colspan="2", style="padding:10px;">
                    &emsp;[ 판매자 가입 수 ]&emsp;
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>전체 판매자 수</td>
                <td align="right">${seller_total_count}명</td>
            </tr>
            <tr>
                <td>최근 7일 가입 판매자 수</td>
                <td align="right">${recent_seller_count}명</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<div style="height: 20px"></div>

<div style="width: 100%;">
    <div id="member_count" style="height: 370px; width: 45%; display: inline-block; margin-left : 35px; margin-right : 50px;" ></div>

    <div id="seller_count" style="height: 370px; width: 45%; display: inline-block;"></div>
</div>

<div class="empty"></div>

<div style="width: 100%;">
    <div id="hotel_price" style="height: 470px; width: 90%; margin-left : 50px; margin-right : 50px;" ></div>
</div>

<div class="empty"></div>

<div>
    <div style="display: inline-block; width: 49%; text-align: center;">
        <table class="admin_count_table stripe" style="margin-left: 200px">
            <thead>
            <tr>
                <th colspan="2", style="padding:15px;">
                    &emsp;&emsp;[ 제휴 승인 건 수 ]&emsp;&emsp;
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="padding:5px;">제휴 승인 대기 건 수</td>
                <td align="right">${waiting_partner_count}건</td>
            </tr>
            <tr>
                <td style="padding:5px;">최근 7일 승인 완료 건 수</td>
                <td align="right">${recent_complete_partner_count}건</td>
                <!-- 					<td align="right">널 만난건</td> -->
            </tr>
            <tr>
                <td style="padding:5px;">최근 7일 승인 거절 건 수</td>
                <td align="right">${recent_refuse_partner_count}건</td>
                <!-- 					<td align="right">내 행복이였던건</td> -->
            </tr>
            </tbody>
        </table>
    </div>
    <div style="display: inline-block; width: 49%; text-align: center;">
        <table class="admin_count_table stripe" style="margin-left: 170px">
            <thead>
            <tr>
                <th colspan="2", style="padding:15px;">
                    &emsp;&emsp;&emsp;[ 쿠폰 건 수 ]&emsp;&emsp;&emsp;
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td style="padding:5px;">사용가능 쿠폰 갯수</td>
                <td align="right">${available_coupon_count}개</td>
            </tr>
            <tr>
                <td style="padding:5px;">최근 7일 쿠폰 발급 갯수</td>
                <td align="right">${recent_take_coupon_count}개</td>
            </tr>
            <tr>
                <td style="padding:5px;">최근 7일 발급 쿠폰 이용 갯수</td>
                <td align="right">${recent_used_coupon_count}개</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
