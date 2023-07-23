<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    request.getParameterMap().forEach((name, value) -> {
        System.out.println("name: " + name);
        for (Object v : value) {
            System.out.println("value: " + v.toString());
        }

        System.out.println("======");
    });


%>