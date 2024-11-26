/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


   function showMessageAndRedirect(message) {
            alert(message);
            setTimeout(function() {
                window.location.href = 'ResponderReclamacion.jsp';
            }, 3000);
        }

        window.onload = function() {
            var messageElement = document.getElementById('message');
            messageElement.innerHTML = "<%= request.getAttribute(\"message\") %>";
            showMessageAndRedirect("<%= request.getAttribute(\"message\") %>");
        };