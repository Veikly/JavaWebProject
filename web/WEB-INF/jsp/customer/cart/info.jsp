<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="myfn" uri="http://sl.cn/functions" %>
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
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .cart-table th, .cart-table td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        .cart-table th {
            background-color: #f2f2f2;
        }

        .cart-table tbody tr:hover {
            background-color: #f9f9f9;
        }

        .cart-table img {
            height: 50px;
            border-radius: 5px;
            box-shadow: 2px 2px 5px #ccc;
        }

        .confirm-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        .confirm-btn:hover {
            background-color: #2980b9;
        }
         a{
            text-decoration: none;
            outline: none;
            color: burlywood;
        }
         a:hover{
            color: coral;
        }
        .cost-sum{
            font-size: 32px;
            color: lime;
         }
       .bottom-info{
           position: relative;
           margin-top: 35px;
       }

    </style>
</head>
<body>
<%--前台 头部导航区域--%>
<c:if test="${empty customer}">
    <div class="nav-links nav">
        <svg t="1717486700832" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1505" width="200" height="200"><path d="M1004.8 614.4 979.2 640c-25.6 25.6-70.4 25.6-96 0l-70.4-70.4 0 377.6L614.4 947.2l0-300.8L409.6 646.4l0 300.8L211.2 947.2 211.2 569.6 140.8 640c-25.6 25.6-70.4 25.6-96 0L19.2 614.4c-25.6-25.6-25.6-70.4 0-96L448 96c19.2-19.2 38.4-25.6 64-19.2 19.2-6.4 44.8 0 64 19.2l428.8 428.8C1030.4 544 1030.4 588.8 1004.8 614.4zM780.8 76.8l134.4 0 0 268.8-134.4-134.4L780.8 76.8z" p-id="1506"></path></svg>
        <a href="book/list">首页</a>
        <svg t="1717486758817" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3414" width="200" height="200"><path d="M915.82 306.62H480.56c-21.21 0-38.4-17.2-38.4-38.4 0-21.21 17.2-38.4 38.4-38.4h435.25c21.21 0 38.4 17.2 38.4 38.4 0.01 21.2-17.18 38.4-38.39 38.4zM337.47 740.22c-18.67 0-35.04-13.64-37.92-32.67l-90.62-598.91c-3.17-20.97 11.26-40.54 32.23-43.72 20.94-3.12 40.54 11.26 43.72 32.23l90.62 598.91c3.17 20.97-11.26 40.54-32.23 43.72-1.95 0.3-3.89 0.44-5.8 0.44z" p-id="3415"></path><path d="M823.81 740.22c-2.71 0-5.47-0.29-8.23-0.89-20.72-4.53-33.85-25-29.32-45.72l94.8-434.04c4.52-20.72 24.97-33.9 45.71-29.32 20.72 4.53 33.85 24.99 29.32 45.71L861.29 710c-3.92 17.96-19.82 30.22-37.48 30.22zM246.24 141.31H105.42c-21.21 0-38.4-17.2-38.4-38.4s17.2-38.4 38.4-38.4h140.82c21.21 0 38.4 17.2 38.4 38.4s-17.19 38.4-38.4 38.4z" p-id="3416"></path><path d="M816.75 741.23H343.09c-21.21 0-38.4-17.2-38.4-38.4s17.2-38.4 38.4-38.4h473.66c21.21 0 38.4 17.2 38.4 38.4s-17.19 38.4-38.4 38.4zM694.57 519.51H310.52c-21.21 0-38.4-17.2-38.4-38.4 0-21.21 17.2-38.4 38.4-38.4h384.05c21.21 0 38.4 17.2 38.4 38.4 0.01 21.21-17.19 38.4-38.4 38.4z" p-id="3417"></path><path d="M335.43 882.69m-76.81 0a76.81 76.81 0 1 0 153.62 0 76.81 76.81 0 1 0-153.62 0Z" p-id="3418"></path><path d="M747.87 882.69m-76.81 0a76.81 76.81 0 1 0 153.62 0 76.81 76.81 0 1 0-153.62 0Z" p-id="3419"></path></svg>
        <a href="cart/info">购物车</a><br>
    </div>
    <div class="nav-links nav">
        <svg t="1717486865358" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4421" width="200" height="200"><path d="M880.182 987.568H143.818C98.705 987.568 62 952.882 62 910.245V801.52c0-122.986 110.113-223.042 245.455-223.042h409.09C851.887 578.478 962 678.533 962 801.52v108.726c0 42.636-36.704 77.322-81.818 77.322z m-736.364-82.197l736.363 0.379V801.52c0-77.873-73.408-141.224-163.637-141.224h-409.09c-90.228 0-163.636 63.351-163.636 141.224v103.851zM511.67 547.796c-140.984 0-255.682-114.697-255.682-255.682 0-140.984 114.697-255.682 255.682-255.682 140.985 0 255.682 114.697 255.682 255.682 0.001 140.985-114.697 255.682-255.682 255.682z m0-429.546c-95.871 0-173.864 77.993-173.864 173.864S415.8 465.978 511.67 465.978s173.864-77.993 173.864-173.864S607.541 118.25 511.67 118.25z" fill="#333333" p-id="4422"></path></svg>
        <a href="login.do">登录</a>
        <svg t="1717486881835" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="5450" width="200" height="200"><path d="M789.779 984.843c-31.732 0-61.762-6.041-90.096-18.134-28.334-12.088-53.08-28.709-74.234-49.865-21.151-21.156-37.772-45.897-49.864-74.229-12.087-28.334-18.134-58.362-18.134-90.1 0-31.732 6.047-61.762 18.134-90.095 12.091-28.333 28.714-52.893 49.864-73.664 21.154-20.78 45.899-37.214 74.234-49.301 28.333-12.091 58.363-18.136 90.096-18.136 31.734 0 61.765 6.044 90.098 18.136 28.334 12.087 52.888 28.521 73.665 49.301 20.779 20.774 37.21 45.334 49.3 73.664 12.088 28.333 18.137 58.362 18.137 90.095 0 31.737-6.049 61.766-18.137 90.1s-28.521 53.073-49.3 74.229c-20.78 21.157-45.332 37.778-73.665 49.865C851.545 978.802 821.514 984.843 789.779 984.843L789.779 984.843zM904.244 715.118l-83.865 0 0-78.197c0-10.581-3.395-19.645-10.198-27.203-6.801-7.554-15.489-11.332-26.069-11.332-10.575 0-18.887 3.778-24.929 11.332-6.043 7.559-9.068 16.622-9.068 27.203l0 78.197-73.665 0c-10.575 0-19.641 3.773-27.197 11.334-7.556 7.553-11.333 16.623-11.333 27.197 0 10.575 3.777 18.512 11.333 23.803 7.557 5.288 16.622 7.928 27.197 7.928l73.665 0 0 80.466c0 10.581 3.025 19.645 9.068 27.2 6.042 7.559 14.354 11.332 24.929 11.332 10.58 0 19.267-3.774 26.069-11.332 6.802-7.556 10.198-16.619 10.198-27.2L820.379 785.38l83.865 0 0 2.27c10.579 0 19.644-3.021 27.198-9.063 7.56-6.048 11.333-14.36 11.333-24.936 0-10.574-3.774-19.645-11.333-27.197C923.889 718.892 914.823 715.118 904.244 715.118L904.244 715.118zM624.321 432.927c-3.023 12.086-6.049 23.042-9.07 32.865-3.021 8.311-6.801 16.811-11.332 25.498-4.534 8.688-9.442 15.301-14.731 19.833-6.801 5.289-11.522 10.957-14.167 17-2.645 6.042-4.915 12.271-6.802 18.697-1.887 6.423-3.966 13.03-6.229 19.832-2.271 6.802-6.049 13.602-11.332 20.399-17.383 22.664-30.416 44.578-39.104 65.732-8.688 21.155-14.731 41.554-18.133 61.201-3.398 19.643-4.345 39.102-2.836 58.362 1.513 19.269 4.533 37.969 9.069 56.1 3.022 13.597 7.555 27.764 13.597 42.499 6.048 14.73 14.925 29.844 26.632 45.333 11.711 15.488 26.634 30.595 44.77 45.332 18.13 14.731 40.794 28.896 67.998 42.499-18.135 3.774-39.291 7.177-63.467 10.199-20.402 2.271-45.521 4.343-75.362 6.229-29.845 1.896-64.036 2.836-102.566 2.836-19.646 0-42.499-0.753-68.564-2.265-26.068-1.512-52.885-3.401-80.465-5.666-27.574-2.269-54.779-4.913-81.599-7.935-26.816-3.022-51.376-6.232-73.665-9.634-22.286-3.397-41.178-6.989-56.666-10.767-15.484-3.776-25.119-7.177-28.898-10.197-6.8-6.049-12.085-22.86-15.864-50.436-3.779-27.57-2.645-63.652 3.398-108.229 3.778-24.933 13.789-44.009 30.032-57.235 16.245-13.22 35.321-23.605 57.235-31.165 21.907-7.555 44.764-14.544 68.563-20.968 23.799-6.419 44.768-15.295 62.902-26.627 14.355-9.067 25.311-17.57 32.864-25.501 7.553-7.935 12.843-16.055 15.864-24.368 3.022-8.306 4.534-17 4.534-26.064 0-9.065-0.377-18.888-1.133-29.469-1.514-15.865-6.984-28.333-16.432-37.396-9.445-9.069-19.456-18.136-30.032-27.199-6.049-4.537-11.333-11.331-15.87-20.401-4.533-9.063-8.307-17.753-11.333-26.063-3.774-9.824-6.797-20.779-9.065-32.865-5.29-1.511-10.198-3.778-14.73-6.801-3.779-3.021-7.936-7.559-12.469-13.603-4.532-6.042-8.688-15.107-12.468-27.199-3.779-11.333-5.101-21.908-3.966-31.729 1.132-9.824 3.214-18.134 6.236-24.936 3.022-8.311 7.177-15.49 12.463-21.531 0-25.688 1.516-51.376 4.539-77.069 3.022-21.907 7.741-45.333 14.167-70.26 6.419-24.936 16.811-47.225 31.166-66.864 13.597-18.892 28.144-34.382 43.628-46.466 15.489-12.091 31.546-21.532 48.166-28.333 16.621-6.802 33.244-11.521 49.867-14.167C380.28 1.323 396.149 0 411.26 0c19.643 0 38.529 2.27 56.664 6.802 18.133 4.531 34.943 10.575 50.433 18.134 15.492 7.553 29.279 16.054 41.365 25.499 12.091 9.441 21.913 19.074 29.468 28.896 17.376 21.909 30.031 46.09 37.969 72.53 7.93 26.446 13.783 51.376 17.563 74.799 3.779 27.199 5.291 54.396 4.534 81.602 4.533 3.774 8.312 8.306 11.332 13.596 3.02 4.532 5.29 10.581 6.801 18.134 1.513 7.553 1.513 17 0 28.333-1.512 14.355-4.534 25.688-9.063 34-4.538 8.313-9.445 14.73-14.736 19.269C637.541 426.878 631.117 430.657 624.321 432.927L624.321 432.927z" fill="#272636" p-id="5451"></path></svg>
        <a href="register.do">注册</a>
    </div>
</c:if>
<c:if test="${!empty customer}">
    <div class="nav-links nav">
        你好， <span class="user-name">${customer.name} </span>
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
</c:if>
<hr>
<%-- 购物车主体内容  --%>
<div>
    <c:if test="${!empty cart.bookItems}">
        <table class="cart-table">
            <thead>
            <tr>
                <th>封面</th>
                <th>书名</th>
                <th>作者</th>
                <th>原价</th>
                <th>折扣价</th>
                <th>购买数量</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cart.bookItems}" var="item" varStatus="s">
                <tr class="cart-item">
                    <td>
                        <a href="book/info?id=${item.book.id}">
                            <img src="${item.book.coverUrl}" alt="图书封面" class="food-cover">
                        </a>
                    </td>
                    <td><a href="book/info?id=${item.book.id}">${item.book.title}</a></td>
                    <td>${item.book.author}</td>
                    <td>${myfn:fmtMoney(item.book.price)}</td>
                    <td>${myfn:fmtMoney(item.book.salePrice)}</td>
                    <td>${item.num}</td>
                    <td><a href="cart/out?id=${item.book.id}">删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="7">
                    总价：<span class="cost-sum">${myfn:fmtMoney(cart.totalPrice)}</span>
                    <a href="order/order.do" class="confirm-btn">确认下单</a>
                </td>
            </tr>
            </tfoot>
        </table>
    </c:if>
    <div class="bottom-info">
        <svg t="1717490697562" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="7651" width="200" height="200"><path d="M491 472.2L141.2 123.3c-17.7-17.7-46.6-17.7-64.3 0-17.7 17.7-17.7 46.6 0 64.3l332.9 324.8-332.9 324c-17.7 17.7-17.7 46.6 0 64.3 17.7 17.7 46.6 17.7 64.3 0L491 552.6c9.6-11.3 20.9-24.9 18.5-39.4 3.2-14.5-7.3-29.7-18.5-41z" fill="#BFBFBF" p-id="7652"></path><path d="M941.3 472.2L591.5 123.3c-17.7-17.7-46.6-17.7-64.3 0-17.7 17.7-17.7 46.6 0 64.3l332.9 324.8-332.9 324c-17.7 17.7-17.7 46.6 0 64.3 17.7 17.7 46.6 17.7 64.3 0l349.8-348.1c9.6-11.3 20.9-24.9 18.5-39.4 3.2-14.5-7.3-29.7-18.5-41z" fill="#BFBFBF" p-id="7653"></path></svg>
        <a href="book/list">继续购物</a>
        <svg t="1717490718488" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="8651" width="200" height="200"><path d="M759.57 1019.58H264.43c-68.18 0-123.64-61.17-123.64-136.36v-500c0-25.09 20.35-45.45 45.45-45.45s45.45 20.36 45.45 45.45v500c0 24.65 14.99 45.45 32.73 45.45h495.15c17.74 0 32.73-20.8 32.73-45.45v-500c0-25.09 20.35-45.45 45.45-45.45s45.45 20.36 45.45 45.45v500c0.01 75.19-55.44 136.36-123.63 136.36zM966.55 246.85H57.45C32.34 246.85 12 226.49 12 201.4s20.35-45.45 45.45-45.45h909.09c25.11 0 45.45 20.36 45.45 45.45s-20.34 45.45-45.44 45.45zM572.61 95.33H451.39c-25.11 0-45.45-20.36-45.45-45.45s20.35-45.45 45.45-45.45H572.6c25.11 0 45.45 20.36 45.45 45.45s-20.33 45.45-45.44 45.45z" p-id="8652"></path><path d="M385.74 837.76c-25.11 0-45.45-20.36-45.45-45.45V398.36c0-25.09 20.35-45.45 45.45-45.45s45.45 20.36 45.45 45.45V792.3c0.01 25.1-20.34 45.46-45.45 45.46zM628.17 837.76c-25.11 0-45.45-20.36-45.45-45.45V398.36c0-25.09 20.35-45.45 45.45-45.45s45.45 20.36 45.45 45.45V792.3c0 25.1-20.34 45.46-45.45 45.46z" p-id="8653"></path></svg>
        <a href="cart/clear">清空购物车</a>
    </div>
</div>
</body>
</html>