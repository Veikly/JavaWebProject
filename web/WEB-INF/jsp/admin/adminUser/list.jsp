<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="myfn" uri="http://sl.cn/functions" %>
<%@ page import="cdu.model.UserStatus" %>
<%@ page import="cdu.model.AdminUser" %>
<%@ page import="cdu.model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <base href="http://${header.host}${pageContext.request.contextPath}/admin/">
    <title>管理员用户管理</title>
    <style>
        h1{
            align-content: center;
            justify-content: center;
        }
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

        .adminuser-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .adminuser-table th, .adminuser-table td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        .adminuser-table th {
            background-color: #f2f2f2;
        }

        .adminuser-table tbody tr:hover {
            background-color: #f9f9f9;
        }

        .adminuser-table img {
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
        form {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            padding: 10px;
            background-color: #f7f7f7;
            border-radius: 5px;
        }

        input[type="text"], select {
            padding: 5px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        select {
            width: 120px;
        }

        input[type="submit"] {
            padding: 5px 10px;
            margin: 5px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 3px;
            cursor: pointer;
        }

    </style>
</head>
<body>
<%--头部导航区域--%>
<div class="nav-links nav">
    <h1>购书网站后台管理平台</h1>
    欢迎登录,管理员
    <span> <svg t="1717502143055" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="12133" width="200" height="200"><path d="M1024 73.142857v292.571429h-73.142857v73.142857l-219.428572-73.142857-219.428571 73.142857-212.626286-73.142857L73.142857 438.857143V365.714286H0v0-292.571429-0.146286V73.142857h73.142857V0H73.069714 950.857143v73.142857h73.142857z m-73.142857 48.786286c0-26.989714-23.405714-48.786286-52.297143-48.786286H125.366857C96.548571 73.142857 73.142857 94.939429 73.142857 121.929143v194.998857c0 26.916571 23.405714 48.786286 52.224 48.786286L292.571429 292.571429l219.428571 73.142857 219.428571-73.142857 167.131429 73.142857c28.891429 0 52.297143-21.869714 52.297143-48.786286V121.929143zM877.714286 950.857143v73.142857H146.285714v-73.142857H73.142857v73.142857-585.142857h73.142857v512h219.428572V585.142857h292.571428v365.714286h219.428572V438.857143h73.142857v512h-73.142857zM585.142857 658.285714H438.857143v292.571429h146.285714V658.285714z" fill="#645E84" p-id="12134"></path></svg>
    <a href="../customer/book/list">前台首页</a>
    </span>
    <span>
       <svg t="1717502262134" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="13168" width="200" height="200"><path d="M697.6 484.8a38.4 38.4 0 0 1 0 76.8H326.4a38.4 38.4 0 1 1 0-76.8h371.2z" fill="#0091FF" p-id="13169"></path><path d="M550.4 708.8a38.4 38.4 0 0 1-76.8 0v-371.2a38.4 38.4 0 1 1 76.8 0v371.2z" fill="#0091FF" p-id="13170"></path><path d="M896 64a64 64 0 0 1 64 64v768a64 64 0 0 1-64 64H128a64 64 0 0 1-64-64V128a64 64 0 0 1 64-64h768z m-12.8 76.8H140.8v742.4h742.4V140.8z" fill="#0091FF" p-id="13171"></path></svg>
       <a href="book/list">图书列表</a>
   </span>

    <span>
        <svg t="1717502608452" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="22148" width="200" height="200"><path d="M512 0C230.4 0 0 230.4 0 512s230.4 512 512 512 512-230.4 512-512S793.6 0 512 0z m256 544h-224v224h-64v-224H256v-64h224V256h64v224h224v64z" fill="#333333" p-id="22149"></path></svg>
        <a href="book/add.do">添加图书</a>
    </span>
    <span>
         <svg t="1717502312284" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="14350" width="200" height="200"><path d="M666.2144 705.536c-16.0256 0-32.2048 6.7584-45.4144 16.896-3.072 2.3552-6.2464 4.4544-8.9088 7.168-4.4032 4.5568-8.192 9.6768-11.264 15.2064a32.256 32.256 0 0 0-3.6864 14.7456v12.6464l-34.4576-32.6656c-2.4064-3.584-5.5296-6.7584-8.6016-9.9328-14.08-14.3872-34.2016-24.064-53.76-24.064H217.6V294.4H819.2v411.136h-152.9856z m163.6352-475.136H206.9504a53.248 53.248 0 0 0-48.1792 32c-3.3792 7.3216-5.12 15.36-5.1712 23.3984v428.3392c0 5.4272 1.024 10.5472 2.3552 15.4624 6.5024 23.04 26.7776 39.936 50.944 39.936h293.1712c3.4816 0.6656 6.656 2.5088 9.0112 5.1712 1.6384 3.072 3.7376 5.8368 6.2464 8.192l59.0848 56.2176c10.0864 11.776 24.064 18.4832 38.8096 18.4832 15.7696 0 30.6176-7.5776 40.7552-20.7872a31.9488 31.9488 0 0 0 6.656-19.3024l0.256-45.8752a13.568 13.568 0 0 1 5.3248-2.0992h163.5328c24.2176 0 44.544-16.896 51.0464-39.936 1.4336-4.9152 2.4064-10.0352 2.4064-15.4624V285.7984c0-8.0896-1.792-16.0768-5.12-23.3984a53.248 53.248 0 0 0-48.2304-32zM316.8256 496.0256a48.0256 48.0256 0 1 0 96-0.0512 48.0256 48.0256 0 0 0-96.0512 0z m159.9488 0a48.0256 48.0256 0 1 0 96.0512-0.0512 48.0256 48.0256 0 0 0-96.0512 0z m153.6 0a48.0256 48.0256 0 1 0 96.0512-0.0512 48.0256 48.0256 0 0 0-96.0512 0z" fill="#DA2D26" p-id="14351"></path></svg>
     <a href="consult/list">咨询列表</a>
     </span>
    <span>
         <svg t="1717502353923" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="15411" width="200" height="200"><path d="M473.902848 481.792c102.4-29.184 177.152-122.88 177.152-235.52 0-135.68-110.592-245.76-245.76-245.76S159.022848 110.592 159.022848 245.76c0 112.64 75.264 206.336 177.152 235.52-162.816 31.232-293.888 164.864-333.824 339.968-12.288 56.32 25.088 112.64 77.312 112.64h648.192c52.224 0 89.6-54.272 77.312-110.592-39.424-177.152-168.448-310.272-331.264-341.504z" fill="#FFCF83" p-id="15412"></path><path d="M709.422848 181.248h281.6c16.896 0 31.232-14.848 31.232-31.232s-14.848-31.232-31.232-31.232h-281.6c-16.896 0-31.232 14.848-31.232 31.232s14.848 31.232 31.232 31.232z" fill="#FFD400" p-id="15413"></path><path d="M993.070848 365.056h-216.576c-16.896 0-31.232 14.848-31.232 31.232s14.848 31.232 31.232 31.232h216.576c16.896 0 31.232-14.848 31.232-31.232s-14.848-31.232-31.232-31.232z" fill="#FFE98D" p-id="15414"></path><path d="M993.070848 612.864h-129.024c-16.896 0-31.232 14.848-31.232 31.232s14.848 31.232 31.232 31.232h129.024c16.896 0 31.232-14.848 31.232-31.232s-14.848-31.232-31.232-31.232z" fill="#FFF2BD" p-id="15415"></path></svg>
    <a href="customer/list">顾客列表</a>
     </span>
    <span>
           <svg t="1717502386236" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="16417" width="200" height="200"><path d="M512 552.128c-140.352 0-254.528-114.176-254.528-254.528S371.648 43.136 512 43.136c140.288 0 254.528 114.176 254.528 254.528S652.288 552.128 512 552.128z m0-444.992c-105.024 0-190.528 85.44-190.528 190.528S406.976 488.128 512 488.128c105.088 0 190.528-85.44 190.528-190.528S617.088 107.136 512 107.136zM525.376 980.864a32.064 32.064 0 0 1-25.216-12.224L424.96 872.512a32.32 32.32 0 0 1-6.464-24.704l31.68-204.032a32 32 0 0 1 31.616-27.072h79.232a32 32 0 0 1 31.616 27.136l31.68 204.032a32 32 0 0 1-5.44 23.232l-67.264 96.128a32.128 32.128 0 0 1-25.344 13.632h-0.896z m-41.472-136.896l40.064 51.2 35.136-50.176-25.472-164.224h-24.384l-25.344 163.2z" fill="#1296db" p-id="16418"></path><path d="M957.824 972.288a32 32 0 0 1-31.872-35.328 416.064 416.064 0 0 0-279.872-436.544 31.872 31.872 0 0 1-20.032-40.512 31.872 31.872 0 0 1 40.64-19.968 479.936 479.936 0 0 1 322.88 503.744 31.936 31.936 0 0 1-31.744 28.608zM66.24 972.288a32 32 0 0 1-31.808-28.672 480.512 480.512 0 0 1 322.688-503.68 32 32 0 0 1 20.608 60.544 416 416 0 0 0-279.616 436.416 32 32 0 0 1-31.872 35.392z" fill="#1296db" p-id="16419"></path></svg>
           <a href="adminUser/list">管理员列表</a>
       </span>

    <span>
<svg t="1717502420905" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="17996" width="200" height="200"><path d="M619.006 578.663c-0.126-7.268-4.637-13.533-10.902-16.415a12.354 12.354 0 0 0 4.762-9.774c0-6.892-5.514-12.405-12.406-12.405s-12.405 5.513-12.405 12.405c0 4.01 1.88 7.518 4.762 9.774-6.266 2.756-10.651 9.022-10.902 16.29 0 0.125-0.125 0.375-0.125 0.5v0.251a1.98 1.98 0 0 0 2.005 2.005 1.98 1.98 0 0 0 2.004-2.005c0-7.518 5.89-13.783 13.283-14.41 0.376 0 0.752 0.125 1.128 0.125 0.376 0 0.752 0 1.127-0.125 7.268 0.627 13.032 6.641 13.283 14.034v0.376a1.98 1.98 0 0 0 2.005 2.005 1.98 1.98 0 0 0 2.005-2.005v-0.25c0.376-0.25 0.376-0.376 0.376-0.376z m-18.546-18.044c-4.51 0-8.27-3.634-8.27-8.27 0-4.512 3.634-8.27 8.27-8.27 4.511 0 8.27 3.633 8.27 8.27 0 4.51-3.633 8.27-8.27 8.27z m30.826 18.294v-0.25c-0.126-7.268-4.511-13.408-10.651-16.29v-0.25c2.756-2.256 4.636-5.765 4.636-9.65 0-6.515-5.012-11.903-11.403-12.28l-0.125 0.126c-1.003 0-1.88 0.877-1.88 2.005v0.125a1.98 1.98 0 0 0 2.005 2.005c0.25 0 0.627-0.125 0.877-0.25 0.125 0.125 0.125 0.25 0.25 0.376 3.51 0.877 6.14 4.135 6.14 8.02 0 3.006-1.628 5.638-4.134 7.142l-0.126 0.125c-0.751 0.25-1.503 0.877-1.754 1.754l-0.25 0.25 0.125 0.126c0 0.25-0.126 0.376-0.126 0.627v0.25c0 1.63 1.254 2.882 2.883 2.882 0.25 0 0.5 0 0.626-0.125 0.25 0.25 0.376 0.501 0.627 0.752 4.761 2.255 8.144 7.017 8.27 12.656v0.376a1.98 1.98 0 0 0 2.005 2.004 1.98 1.98 0 0 0 2.005-2.004v-0.502z m0 0" p-id="17997"></path><path d="M941.794 799.828l-88.341 0.376-0.376-90.095c0-24.435-18.42-44.233-42.855-44.233s-44.233 19.798-44.233 44.233l-0.125 90.47-89.468 0.376c-24.435 0-44.233 18.42-44.233 42.855 0 24.435 19.798 44.233 44.233 44.233l89.343 0.125-0.126 91.599c0 24.435 19.799 44.233 44.233 44.233 24.435 0 44.233-19.798 44.233-44.233l-0.375-91.473 88.09 0.125c24.434 0 44.233-19.798 44.233-44.233 0-24.56-19.799-44.358-44.233-44.358z m-281.062-114.53c4.887 3.509 9.649 7.017 14.285 10.651v-8.395c16.54 0 31.076-9.148 38.595-22.68h7.267l-2.756-44.234h5.012a398.343 398.343 0 0 0-16.54-12.03c-4.637-4.886-10.401-8.645-16.792-11.026-18.92-11.904-38.844-22.305-59.645-31.327 81.574-55.886 135.205-149.74 135.205-256.125C765.363 138.964 626.399 0 454.98 0 283.562 0 144.723 138.964 144.723 310.383c0 106.384 53.63 200.364 135.205 256.25C140.337 626.78 37.71 756.597 16.158 912.353a43.941 43.941 0 0 0-2.505 14.66l0.376 3.509v0.626c0 24.435 19.798 44.233 44.233 44.233 24.434 0 44.233-19.798 44.233-44.233v-0.5h0.751c20.676-169.039 160.141-301.236 332.312-310.634 6.39 0.376 12.906 0.626 19.422 0.626s13.032-0.25 19.548-0.626c61.15 3.258 118.163 22.179 167.283 52.628 5.012 5.764 11.528 10.15 18.921 12.656zM454.98 532.048c-122.424 0-221.666-99.241-221.666-221.665S332.556 88.717 454.98 88.717s221.666 99.242 221.666 221.666-99.242 221.666-221.666 221.666z m0 0" p-id="17998"></path></svg>
         <a href="adminUser/add.do">添加管理员</a>
    </span>

    <span>
<svg t="1717502474688" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="19141" width="200" height="200"><path d="M736.779125 956.09273375l-477.29825062 0.10282219h-0.03427313c-66.73127156-0.10282125-121.15821563-57.85433344-121.22676375-128.73274688V194.04697156C138.28838469 123.16855813 192.71532875 65.41704688 259.44660125 65.31422469h477.29824969C803.51039655 65.41704688 857.93734062 123.16855813 858.00588781 194.04697156v633.31301625c-0.06854813 70.91268656-54.49549125 128.66419875-121.22676281 128.73274594z m57.71723719-762.04576219c-0.06854813-33.72551156-25.94533781-61.21317469-57.75151125-61.28172281l-477.26397657 0.10282124c-31.77190031 0.03427406-57.68296406 27.52193719-57.71723718 61.28172282v633.31301625c0.03427406 33.72551156 25.94533781 61.21317469 57.71723719 61.24744875h477.26397656c31.80617345-0.03427406 57.68296406-27.52193719 57.75151125-61.28172281V194.04697156z m-106.2147975 350.519115l-1.74796875-0.06854718-378.65798251 0.06854718a31.63480406 31.63480406 0 0 1-27.24774562-16.34864718 35.40493219 35.40493219 0 0 1-0.03427406-34.85655 31.70335219 31.70335219 0 0 1 27.24774563-16.34864813l1.78224281 0.06854813 378.69225656-0.06854813c11.07046781 0 21.48973125 6.2721225 27.21347156 16.34864813 6.10075312 10.76200311 6.10075312 24.12882187 0 34.85655a31.63480406 31.63480406 0 0 1-27.24774562 16.34864718z m-1.40523-127.05332531H309.28084345c-17.54823375 0-31.8404475-15.14906156-31.84044845-33.79405969 0-18.61072406 14.29221375-33.75978562 31.84044845-33.75978562h377.59549124c17.54823375 0 31.80617345 15.14906156 31.80617344 33.75978562 0 18.64499813-14.25793969 33.79405968-31.80617344 33.79405969zM310.10341625 604.0655675l256.81428938-0.03427406c17.54823375 0 31.80617345 15.14906156 31.80617343 33.75978562 0 18.61072406-14.25793969 33.75978562-31.80617343 33.75978563l-257.67113625-0.41128688a31.36061344 31.36061344 0 0 1-29.9896575-15.45752625 35.81621906 35.81621906 0 0 1 0-36.19323187 31.18924406 31.18924406 0 0 1 30.84650437-15.42325219z" p-id="19142"></path></svg>
           <a href="order/list">订单列表</a>
     </span>

    <span>
<svg t="1717502519385" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="20146" width="200" height="200"><path d="M636.172598 447.930011c37.402156 0 67.701422 33.050836 67.701422 73.844462l0 172.261084c0 40.761631-30.299266 73.812467-67.701422 73.812467l-248.217216 0c-37.370161 0-67.701422-33.050836-67.701422-73.812467l0-172.261084c0-40.761631 30.299266-73.844462 67.701422-73.844462L448.009998 447.930011l0 0 127.980003 0 0 0L636.172598 447.930011zM511.520075 512.239963c-35.322481 0-63.990002 27.387721-63.990002 61.206436 0 22.588471 17.53326 39.865771 36.602281 50.488111l0 79.539572 54.807436 0 0-79.539572c19.06902-10.62234 36.602281-27.899641 36.602281-50.488111C575.510077 539.627683 546.842556 512.239963 511.520075 512.239963zM512 320.109983c-60.150601 0-63.830027 50.584096-63.990002 63.990002l0 63.798032-64.405937 0 0-57.622996c0 0 0.031995-134.379003 128.139978-134.379003 128.139978 0 128.139978 134.379003 128.139978 134.379003l0 57.622996L575.990002 447.898016l0-63.798032C575.862022 370.918044 572.150601 320.109983 512 320.109983zM512 1024c-282.739822 0-511.920012-229.180191-511.920012-511.920012s229.180191-511.920012 511.920012-511.920012c91.121762 0 176.612404 23.964256 250.712826 65.717732l47.608561-65.877707L895.556069 224.06099l-223.453085-32.794876 52.759756-73.012592C661.512639 83.922887 589.107952 64.181972 512 64.181972c-247.385346 0-447.930011 200.544665-447.930011 447.930011s200.544665 447.930011 447.930011 447.930011 447.930011-200.544665 447.930011-447.930011c0-60.406561-12.126105-117.933573-33.786721-170.533354l59.158756-24.348196C1010.066177 377.317044 1023.920012 443.066771 1023.920012 512.111983 1023.920012 794.819809 794.739822 1024 512 1024z" p-id="20147"></path></svg>
<a href="reset?id=${admin.id }">重置密码</a>
    </span>

    <span>
<svg t="1717502544404" class="icon" viewBox="0 0 1042 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="21131" width="200" height="200"><path d="M581.632 697.344l126.976 0 0 194.56q0 33.792-10.24 58.88t-27.136 40.96-39.424 23.552-48.128 7.68l-452.608 0q-24.576 0-48.128-9.728t-41.472-27.136-29.184-40.96-11.264-52.224l0-706.56q0-24.576 11.776-47.104t30.208-39.936 40.96-28.16 45.056-10.752l449.536 0q26.624 0 50.176 11.776t41.472 29.696 28.16 40.448 10.24 44.032l0 188.416-126.976 0 1.024-195.584-452.608 0-1.024 713.728 452.608 0 0-195.584zM1021.952 505.856q37.888 30.72 2.048 60.416-20.48 15.36-44.544 37.888t-50.176 46.592-51.712 47.616-47.104 40.96q-23.552 18.432-40.448 18.432t-16.896-24.576q2.048-14.336 0.512-35.84t-1.536-36.864q0-17.408-12.288-21.504t-29.696-4.096l-40.96 0-62.464 0q-34.816 0-73.216-0.512t-73.216-0.512l-62.464 0-41.984 0q-8.192 0-17.92-1.536t-17.408-6.656-12.288-14.336-4.608-23.552q0-19.456-0.512-46.08t0.512-47.104q0-27.648 13.312-37.888t43.008-9.216l33.792 0 59.392 0q32.768 0 70.144 0.512t71.168 0.512l61.44 0 38.912 0q25.6 1.024 43.52-4.096t17.92-22.528q0-14.336 1.024-32.256t1.024-32.256q0-23.552 12.8-29.696t32.256 9.216q19.456 16.384 45.568 38.4t52.736 45.056 52.736 45.568 47.616 39.936z" p-id="21132"></path></svg>
        <a href="logout">退出</a>
    </span>
</div>
<hr>
<h2>管理员用户列表</h2>
<form action="adminUser/query" method="post">
    管理员用户名：<input type="text" name="name">
    状态：<select name="statusName">
    <option value="" selected>全部</option>
    <option value="冻结">冻结</option>
    <option value="正常">正常</option>
    <option value="异常">异常</option>
</select>
    <input type="submit" value="查询">
</form>
<table class="adminuser-table">
    <tr>
        <th>序号</th>
        <th>id</th>
        <th>管理员用户名</th>
        <th>管理员密码</th>
        <th>创建时间</th>
        <th>最后一次访问时间</th>
        <th>操作</th>
        <th>状态</th>
    </tr>
    <c:forEach items="${adminUsers }" var="user" varStatus="s">
        <tr>
            <td>${s.count }</td>
            <td>${user.id }</td>
            <td>${user.name }</td>
            <td>${myfn:fmtDateTime(user.createTime) } </td>
            <td>${myfn:fmtDateTime(user.lastAccessTime) } </td>
            <td>
                <a href="adminUser/reset?id=${user.id }">重置密码</a>
                <a href="adminUser/modPre?id=${user.id }">修改</a>
                <a href="adminUser/del?id=${user.id }">删除</a></td>
            <td>
                    ${user.status.name }
                <c:if test="${user.status==UserStatus.NORMAL }">
                    <a href="adminUser/freeze?id=${user.id }">冻结</a>
                </c:if>
                <c:if test="${user.status!=UserStatus.NORMAL }">
                    <a href="adminUser/active?id=${user.id }">解冻</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
<%--  分页导航--%>
<c:if test="${p>1}">
    <a href="adminUser/list?p=${p-1 }">上一页</a>
</c:if>
<c:if test="${p<pCount}">
    <a href="adminUser/list?p=${p+1 }">下一页</a>
</c:if>
</body>
</html>