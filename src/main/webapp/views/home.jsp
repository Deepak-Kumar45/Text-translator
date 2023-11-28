<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Translator</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
      </head>
      <body>
        <%
            String data=(String)request.getAttribute("data");
        %>
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h2>The Text-Translator</h2>
                </div>
                <div class="col">
                    <form action="translate" method="get">
                        <textarea name="inputText" id="input" cols="30" rows="10" placeholder="enter text to translate"></textarea>
                        <select name="sourceLang" id="sl">
                            <option value="">Select source language</option>
                            <option value="hi">Hindi</option>
                            <option value="en">English</option>
                            <option value="">Select source language</option>
                            <option value="">Select source language</option>
                            <option value="">Select source language</option>
                            <option value="">Select source language</option>
                            <option value="">Select source language</option>
                        </select>
                        <select name="targetLang" id="tl">
                            <option value="">Select target language</option>
                            <option value="hi">Hindi</option>
                            <option value="en">English</option>
                            <option value="">Select source language</option>
                            <option value="">Select source language</option>
                            <option value="">Select source language</option>
                            <option value="">Select source language</option>
                            <option value="">Select source language</option>
                        </select>
                        <input type="submit">

                    </form>
                
                </div>
                <%
                    if(data.length!=0)
                    {
                        %>
                        <textarea name="outputText" id="ot" cols="30" rows="10"><%=data%></textarea>
                        <%
                    }else{
                        %>
                        
                <textarea name="outputText" id="ot" cols="30" rows="10"></textarea>
                        <%
                    }
                %>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
      </body>
</html>