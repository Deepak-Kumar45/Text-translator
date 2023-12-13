<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Text Translator</title>
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome CDN Link for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
        /* Import Google Font - Poppins */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0 10px;
            min-height: 100vh;
            background: #5372F0;
        }

        .container {
            max-width: 690px;
            width: 100%;
            padding: 30px;
            background: #fff;
            border-radius: 7px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.01);
        }

        .wrapper {
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .wrapper .text-input {
            display: flex;
            border-bottom: 1px solid #ccc;
        }

        .text-input .to-text {
            border-radius: 0px;
            border-left: 1px solid #ccc;
        }

        .text-input textarea {
            height: 250px;
            width: 100%;
            border: none;
            outline: none;
            resize: none;
            background: none;
            font-size: 18px;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .text-input textarea::placeholder {
            color: #b7b6b6;
        }

        .controls,
        li,
        .icons,
        .icons i {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .controls {
            list-style: none;
            padding: 12px 15px;
        }

        .controls .row .icons {
            width: 38%;
        }

        .controls .row .icons i {
            width: 50px;
            color: #adadad;
            font-size: 14px;
            cursor: pointer;
            transition: transform 0.2s ease;
            justify-content: center;
        }

        .controls .row.from .icons {
            padding-right: 15px;
            border-right: 1px solid #ccc;
        }

        .controls .row.to .icons {
            padding-left: 15px;
            border-left: 1px solid #ccc;
        }

        .controls .row select {
            color: #333;
            border: none;
            outline: none;
            font-size: 18px;
            background: none;
            padding-left: 5px;
        }

        .text-input textarea::-webkit-scrollbar {
            width: 4px;
        }

        .controls .row select::-webkit-scrollbar {
            width: 8px;
        }

        .text-input textarea::-webkit-scrollbar-track,
        .controls .row select::-webkit-scrollbar-track {
            background: #fff;
        }

        .text-input textarea::-webkit-scrollbar-thumb {
            background: #ddd;
            border-radius: 8px;
        }

        .controls .row select::-webkit-scrollbar-thumb {
            background: #999;
            border-radius: 8px;
            border-right: 2px solid #ffffff;
        }

        .controls .exchange {
            color: #adadad;
            cursor: pointer;
            font-size: 16px;
            transition: transform 0.2s ease;
        }

        .controls i:active {
            transform: scale(0.9);
        }

        .container button {
            width: 100%;
            padding: 14px;
            outline: none;
            border: none;
            color: #fff;
            cursor: pointer;
            margin-top: 20px;
            font-size: 17px;
            border-radius: 5px;
            background: #5372F0;
        }

        @media (max-width: 660px) {
            .container {
                padding: 20px;
            }

            .wrapper .text-input {
                flex-direction: column;
            }

            .text-input .to-text {
                border-left: 0px;
                border-top: 1px solid #ccc;
            }

            .text-input textarea {
                height: 200px;
            }

            .controls .row .icons {
                display: none;
            }

            .container button {
                padding: 13px;
                font-size: 16px;
            }

            .controls .row select {
                font-size: 16px;
            }

            .controls .exchange {
                font-size: 14px;
            }
        }
    </style>
</head>

<body>
    <%
        String str=(String)request.getAttribute("text");
    %>
    <form action="translate">
        <div class="container">
            <div class="wrapper">
                <div class="text-input">
                    <textarea spellcheck="false" class="from-text" name="inputText" placeholder="Enter text to translate" id="inputText" onclick="showMsg()" readonly="true" required></textarea>
                    <%
                    if(str!=null){
                        if(str.length()!=0){
                            %><textarea spellcheck="false" readonly disabled class="to-text" id="outputText" placeholder="Translation"><%=str%></textarea><%
                        }else{
                            %>
                            <textarea spellcheck="false" readonly disabled class="to-text" id="outputText" placeholder="Translation"></textarea>
                            <%
                        }
                    }else{
                        %>
                        <textarea spellcheck="false" readonly disabled class="to-text" id="outputText" placeholder="Translation"></textarea>
                        <%
                    }
                    %>
                </div>
                <ul class="controls">
                    <li class="row from">
                        <div class="icons">
                            <i id="from" class="fas fa-copy"></i>
                        </div>
                        <select style="font-size: 16px;" name="source" id="source" required>
                            <option value="">Select source Language</option>
                            <option value="sq">ALBANIAN</option>
                            <option value="ar">ARABIC</option>
                            <option value="az">AZERBAIJANI</option>
                            <option value="bn">BENGALI</option>
                            <option value="bg">BULGARIAN</option>
                            <option value="ca">CATALAN</option>
                            <option value="zh">CHINESE</option>
                            <option value="cs">CZECH</option>
                            <option value="da">DANISH</option>
                            <option value="nl">DUTCH</option>
                            <option value="en">ENGLISH</option>
                            <option value="et">ESTONIAN</option>
                            <option value="eo">ESPERANTO</option>
                            <option value="fi">FINNISH</option>
                            <option value="fr">FRENCH</option>
                            <option value="de">GERMAN</option>
                            <option value="el">GREEK</option>
                            <option value="he">HEBREW</option>
                            <option value="hi">HINDI</option>
                            <option value="hu">HUNGARIAN</option>
                            <option value="id">INDONESIAN</option>
                            <option value="ga">IRISH</option> 
                            <option value="it">ITALIAN</option>
                            <option value="ja">JAPANESE</option>
                            <option value="ko">KOREAN</option>
                            <option value="lv">LATVIAN</option>
                            <option value="lt">LITHUANIAN</option>
                            <option value="ms">MALAY</option>
                            <option value="nb">NORWEGIAN</option>
                            <option value="fa">PERSIAN</option>
                            <option value="pl">POLISH</option>
                            <option value="pt">PORTUGUESE</option>
                            <option value="ro">ROMANIAN</option>
                            <option value="ru">RUSSIAN</option>
                            <option value="sr">Serbian</option>
                            <option value="sk">SLOVAK</option>
                            <option value="sl">SLOVENIAN</option>
                            <option value="es">SPANISH</option>
                            <option value="sv">SWEDISH</option>
                            <option value="tl">TAGALOG</option>
                            <option value="th">THAI</option>
                            <option value="tr">TURKISH</option>
                            <option value="uk">UKRAINIAN</option>
                            <option value="vi">VIETNAMESE</option>
                        </select>
                    </li>
                    <li class="exchange"><i class="fas fa-exchange-alt"></i></li>
                    <li class="row to">
                        <select style="font-size: 16px;" name="target" required>
                            <option value="">Select target Language</option>
                            <option value="sq">ALBANIAN</option>
                            <option value="ar">ARABIC</option>
                            <option value="az">AZERBAIJANI</option>
                            <option value="bn">BENGALI</option>
                            <option value="bg">BULGARIAN</option>
                            <option value="ca">CATALAN</option>
                            <option value="zh">CHINESE</option>
                            <option value="cs">CZECH</option>
                            <option value="da">DANISH</option>
                            <option value="nl">DUTCH</option>
                            <option value="en">ENGLISH</option>
                            <option value="et">ESTONIAN</option>
                            <option value="eo">ESPERANTO</option>
                            <option value="fi">FINNISH</option>
                            <option value="fr">FRENCH</option>
                            <option value="de">GERMAN</option>
                            <option value="el">GREEK</option>
                            <option value="he">HEBREW</option>
                            <option value="hi">HINDI</option>
                            <option value="hu">HUNGARIAN</option>
                            <option value="id">INDONESIAN</option>
                            <option value="ga">IRISH</option> 
                            <option value="it">ITALIAN</option>
                            <option value="ja">JAPANESE</option>
                            <option value="ko">KOREAN</option>
                            <option value="lv">LATVIAN</option>
                            <option value="lt">LITHUANIAN</option>
                            <option value="ms">MALAY</option>
                            <option value="nb">NORWEGIAN</option>
                            <option value="fa">PERSIAN</option>
                            <option value="pl">POLISH</option>
                            <option value="pt">PORTUGUESE</option>
                            <option value="ro">ROMANIAN</option>
                            <option value="ru">RUSSIAN</option>
                            <option value="sr">Serbian</option>
                            <option value="sk">SLOVAK</option>
                            <option value="sl">SLOVENIAN</option>
                            <option value="es">SPANISH</option>
                            <option value="sv">SWEDISH</option>
                            <option value="tl">TAGALOG</option>
                            <option value="th">THAI</option>
                            <option value="tr">TURKISH</option>
                            <option value="uk">UKRAINIAN</option>
                            <option value="vi">VIETNAMESE</option>
                        </select>
                        <div class="icons">
                            <i id="to" class="fas fa-copy"></i>
                        </div>
                    </li>
                </ul>

            </div>
            <button type="submit">Translate Text</button>

        </div>
    </form>
    <script src="js/script.js"></script>
    <script>
        let source = document.getElementById("source");
        source.addEventListener("change", handleSelectChange);

        function handleSelectChange(event) {
            let currentValue = event.target.value;
            console.log(currentValue)
            if(currentValue!=null && currentValue!==""){
                document.getElementById("inputText").removeAttribute("readonly");
            }
        }

        function showMsg(){
            console.log("input text clicked");
            console.log(document.getElementById("inputText").hasAttribute("readonly"));
            if(document.getElementById("inputText").hasAttribute("readonly")){
            document.getElementById("source").click();
        }
        }
        
        // function showMsg() {
            
        //     str=document.getElementById("inputText").hasAttribute("readonly");
        //     if(str==true){
        //         alert("Select a source languge");
        //     }
        //     source=document.getElementById("source").value;
        //     alert(source);

        // }
    </script>
</body>

</html>