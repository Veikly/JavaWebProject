<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="myfn" uri="http://sl.cn/functions" %>
<%@ page import="cdu.model.OrderStatus" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <base href="http://${header.host}${pageContext.request.contextPath}/customer/">
    <title>购书网站</title>
    <style>
        .nav{
            display: inline-block;
            margin: 30px;
            align-content: center;
            text-align: center;
        }
        .nav-links {
            margin-bottom: 10px;
        }

        .nav-links a {
            text-decoration: none;
            padding: 5px 10px;
            margin-right: 10px;
            color: #333;
            transition: background-color 0.2s, color 0.2s;
        }

        .nav-links a:hover {
            background-color: #f9f9f9;
            color: #007bff;
        }

        .nav:hover .nav-links:hover .icon:hover{
            fill: aquamarine;
        }
        .icon{
            width: 24px;
            height: 24px;
        }
        .user-name{
            color: lawngreen;
            font-size: 32px;
        }
        .order-record-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .order-record-table, .order-record-table td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        .order-record-table th {
            background-color: #f2f2f2;
        }

        .order-record-table tbody tr:hover {
            background-color: #f9f9f9;
        }

        .order-record-table img {
            height: 50px;
            border-radius: 5px;
            box-shadow: 2px 2px 5px #ccc;
        }
        a{
            text-decoration: none;
            outline: none;
            color: burlywood;
        }
        a:hover{
            color: coral;
        }

    /*    删除动画*/
        @keyframes fadeOut {
            0% { opacity: 1; }
            100% { opacity: 0; height: 0; padding: 0; margin: 0; border: 0; }
        }

        .fade-out {
            animation: fadeOut 0.5s forwards;
        }
    </style>
</head>
<body>
<%--前台 头部导航区域--%>
<%-- 顾客已登录 --%>
<div class="nav-links nav">
    你好，<span class="user-name">${customer.name}</span>
    <svg t="1717486700832" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1505" width="200" height="200"><path d="M1004.8 614.4 979.2 640c-25.6 25.6-70.4 25.6-96 0l-70.4-70.4 0 377.6L614.4 947.2l0-300.8L409.6 646.4l0 300.8L211.2 947.2 211.2 569.6 140.8 640c-25.6 25.6-70.4 25.6-96 0L19.2 614.4c-25.6-25.6-25.6-70.4 0-96L448 96c19.2-19.2 38.4-25.6 64-19.2 19.2-6.4 44.8 0 64 19.2l428.8 428.8C1030.4 544 1030.4 588.8 1004.8 614.4zM780.8 76.8l134.4 0 0 268.8-134.4-134.4L780.8 76.8z" p-id="1506"></path></svg>
    <a href="book/list">首页</a>
    <svg t="1717486758817" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3414" width="200" height="200"><path d="M915.82 306.62H480.56c-21.21 0-38.4-17.2-38.4-38.4 0-21.21 17.2-38.4 38.4-38.4h435.25c21.21 0 38.4 17.2 38.4 38.4 0.01 21.2-17.18 38.4-38.39 38.4zM337.47 740.22c-18.67 0-35.04-13.64-37.92-32.67l-90.62-598.91c-3.17-20.97 11.26-40.54 32.23-43.72 20.94-3.12 40.54 11.26 43.72 32.23l90.62 598.91c3.17 20.97-11.26 40.54-32.23 43.72-1.95 0.3-3.89 0.44-5.8 0.44z" p-id="3415"></path><path d="M823.81 740.22c-2.71 0-5.47-0.29-8.23-0.89-20.72-4.53-33.85-25-29.32-45.72l94.8-434.04c4.52-20.72 24.97-33.9 45.71-29.32 20.72 4.53 33.85 24.99 29.32 45.71L861.29 710c-3.92 17.96-19.82 30.22-37.48 30.22zM246.24 141.31H105.42c-21.21 0-38.4-17.2-38.4-38.4s17.2-38.4 38.4-38.4h140.82c21.21 0 38.4 17.2 38.4 38.4s-17.19 38.4-38.4 38.4z" p-id="3416"></path><path d="M816.75 741.23H343.09c-21.21 0-38.4-17.2-38.4-38.4s17.2-38.4 38.4-38.4h473.66c21.21 0 38.4 17.2 38.4 38.4s-17.19 38.4-38.4 38.4zM694.57 519.51H310.52c-21.21 0-38.4-17.2-38.4-38.4 0-21.21 17.2-38.4 38.4-38.4h384.05c21.21 0 38.4 17.2 38.4 38.4 0.01 21.21-17.19 38.4-38.4 38.4z" p-id="3417"></path><path d="M335.43 882.69m-76.81 0a76.81 76.81 0 1 0 153.62 0 76.81 76.81 0 1 0-153.62 0Z" p-id="3418"></path><path d="M747.87 882.69m-76.81 0a76.81 76.81 0 1 0 153.62 0 76.81 76.81 0 1 0-153.62 0Z" p-id="3419"></path></svg>
    <a href="cart/info">购物车</a>
    <svg t="1717490464062" class="icon" viewBox="0 0 1066 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="6446" width="200" height="200"><path d="M14.208 426.666667c81.066667 213.333333 187.733333 341.333333 311.466667 384s337.066667 46.933333 627.2 12.8v29.866666c0 93.866667-76.8 170.666667-170.666667 170.666667h-554.666667c-119.466667 0-213.333333-93.866667-213.333333-213.333333v-384z" fill="#C7CFFF" p-id="6447"></path><path d="M483.541333 1024h-298.666666c-93.866667 0-170.666667-76.8-170.666667-170.666667V170.666667c0-93.866667 76.8-170.666667 170.666667-170.666667h597.333333c93.866667 0 170.666667 76.8 170.666667 170.666667v256c0 25.6-17.066667 42.666667-42.666667 42.666666s-42.666667-17.066667-42.666667-42.666666V170.666667c0-46.933333-38.4-85.333333-85.333333-85.333334h-597.333333c-46.933333 0-85.333333 38.4-85.333334 85.333334v682.666666c0 46.933333 38.4 85.333333 85.333334 85.333334h298.666666c25.6 0 42.666667 17.066667 42.666667 42.666666s-17.066667 42.666667-42.666667 42.666667z" fill="#3689F5" p-id="6448"></path><path d="M760.874667 469.333333c-153.6 0-277.333333 123.733333-277.333334 277.333334s123.733333 277.333333 277.333334 277.333333 277.333333-123.733333 277.333333-277.333333-123.733333-277.333333-277.333333-277.333334z m0 85.333334c106.666667 0 192 85.333333 192 192s-85.333333 192-192 192-192-85.333333-192-192 85.333333-192 192-192z" fill="#3689F5" p-id="6449"></path><path d="M760.874667 810.666667c25.6 0 42.666667-17.066667 42.666666-42.666667v-128c0-25.6-17.066667-42.666667-42.666666-42.666667s-42.666667 17.066667-42.666667 42.666667v128c0 21.333333 21.333333 42.666667 42.666667 42.666667z" fill="#3689F5" p-id="6450"></path><path d="M760.874667 810.666667h85.333333c25.6 0 42.666667-17.066667 42.666667-42.666667s-17.066667-42.666667-42.666667-42.666667h-85.333333c-25.6 0-42.666667 17.066667-42.666667 42.666667s21.333333 42.666667 42.666667 42.666667zM99.541333 298.666667h768V213.333333h-768v85.333334z" fill="#3689F5" p-id="6451"></path><path d="M270.208 426.666667h213.333333c25.6 0 42.666667 17.066667 42.666667 42.666666s-17.066667 42.666667-42.666667 42.666667h-213.333333c-25.6 0-42.666667-17.066667-42.666667-42.666667s17.066667-42.666667 42.666667-42.666666zM270.208 597.333333h128c25.6 0 42.666667 17.066667 42.666667 42.666667s-17.066667 42.666667-42.666667 42.666667h-128c-25.6 0-42.666667-17.066667-42.666667-42.666667s17.066667-42.666667 42.666667-42.666667z" fill="#F4B300" p-id="6452"></path></svg>
    <a href="order/list?customerId=${customer.id }">订单历史</a>
</div>
<div class="nav-links nav">
    <svg t="1717491931384" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="9653" width="200" height="200"><path d="M636.172598 447.930011c37.402156 0 67.701422 33.050836 67.701422 73.844462l0 172.261084c0 40.761631-30.299266 73.812467-67.701422 73.812467l-248.217216 0c-37.370161 0-67.701422-33.050836-67.701422-73.812467l0-172.261084c0-40.761631 30.299266-73.844462 67.701422-73.844462L448.009998 447.930011l0 0 127.980003 0 0 0L636.172598 447.930011zM511.520075 512.239963c-35.322481 0-63.990002 27.387721-63.990002 61.206436 0 22.588471 17.53326 39.865771 36.602281 50.488111l0 79.539572 54.807436 0 0-79.539572c19.06902-10.62234 36.602281-27.899641 36.602281-50.488111C575.510077 539.627683 546.842556 512.239963 511.520075 512.239963zM512 320.109983c-60.150601 0-63.830027 50.584096-63.990002 63.990002l0 63.798032-64.405937 0 0-57.622996c0 0 0.031995-134.379003 128.139978-134.379003 128.139978 0 128.139978 134.379003 128.139978 134.379003l0 57.622996L575.990002 447.898016l0-63.798032C575.862022 370.918044 572.150601 320.109983 512 320.109983zM512 1024c-282.739822 0-511.920012-229.180191-511.920012-511.920012s229.180191-511.920012 511.920012-511.920012c91.121762 0 176.612404 23.964256 250.712826 65.717732l47.608561-65.877707L895.556069 224.06099l-223.453085-32.794876 52.759756-73.012592C661.512639 83.922887 589.107952 64.181972 512 64.181972c-247.385346 0-447.930011 200.544665-447.930011 447.930011s200.544665 447.930011 447.930011 447.930011 447.930011-200.544665 447.930011-447.930011c0-60.406561-12.126105-117.933573-33.786721-170.533354l59.158756-24.348196C1010.066177 377.317044 1023.920012 443.066771 1023.920012 512.111983 1023.920012 794.819809 794.739822 1024 512 1024z" p-id="9654"></path></svg>
    <a href="reset?id=${customer.id }">重置密码</a>
    <svg t="1717491951504" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="10634" width="200" height="200"><path d="M0 192v640c0 70.7 57.3 128 128 128h352c17.7 0 32-14.3 32-32s-14.3-32-32-32H128c-35.3 0-64-28.7-64-64V192c0-35.3 28.7-64 64-64h352c17.7 0 32-14.3 32-32s-14.3-32-32-32H128C57.3 64 0 121.3 0 192z" p-id="10635"></path><path d="M1013.3 488.3L650.9 160.7c-41.2-37.2-106.9-8-106.9 47.5V339c0 4.4-3.6 8-8 8H224c-17.7 0-32 14.3-32 32v266c0 17.7 14.3 32 32 32h312c4.4 0 8 3.6 8 8v130.9c0 55.5 65.8 84.7 106.9 47.5l362.4-327.6c14.1-12.8 14.1-34.8 0-47.5zM256 597V427c0-8.8 7.2-16 16-16h304c17.7 0 32-14.3 32-32V244.9c0-13.9 16.4-21.2 26.7-11.9L938 506.1c3.5 3.2 3.5 8.7 0 11.9L634.7 791c-10.3 9.3-26.7 2-26.7-11.9V645c0-17.7-14.3-32-32-32H272c-8.8 0-16-7.2-16-16z" p-id="10636"></path></svg>
    <a href="logout">退出</a>
</div>
<hr>
<%--  主体内容  --%>
<div>
    <%--  路径导航--%>
    <div>
        <a href="book/list">首页</a>
        订单历史
    </div>
    <%--  订单历史主体--%>
    <table class="order-record-table">
        <tr >
            <th>订单编号</th>
            <th>创建时间</th>
            <th>订单金额</th>
            <th>收货人</th>
            <th>详情</th>
            <th>订单状态</th>
        </tr>
        <c:forEach items="${orders}" var="order" varStatus="s">
            <tr data-order-id="${order.orderId}">
                <td>${order.orderId }
                </td>
                <td>${myfn:fmtDateTime(order.createTime) }
                </td>
                <td>${myfn:fmtMoney(order.money) }
                </td>
                <td>${order.receiverName }
                </td>
                <td><a href="order/info?orderId=${order.orderId }">订单详情</a></td>
                <td>
                    <span class="text-danger">${order.status.name }</span>
                    <c:if test="${order.status==OrderStatus.UNPAID}">
                        <a href="order/pay?orderId=${order.orderId}">付款</a>
                        <a href="order/cancel?orderId=${order.orderId}">取消订单</a>
                    </c:if>
                    <c:if test="${order.status==OrderStatus.PAID }">
                        <a href="order/cancel?orderId=${order.orderId}">取消订单</a>
                    </c:if>
                    <c:if test="${order.status==OrderStatus.SHIPPED}">
                        物流单号：${order.expressNumber }
                        <a href="order/finish?orderId=${order.orderId}">确认收货</a>
                    </c:if>
                    <c:if test="${order.status==OrderStatus.CANCEL}">
                        <a href="order/del?orderId=${order.orderId}"  onclick="deleteOrder(${order.orderId})">删除订单</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>

<script>
    function deleteOrder(orderId) {
        var orderRow = document.querySelector('tr[data-order-id="' + orderId + '"]');
        orderRow.classList.add('fade-out');

        setTimeout(function() {
            orderRow.remove();
        }, 500); // 0.5s, should match the animation duration
    }
</script>