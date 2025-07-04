<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <div class="footer container-fluid justify-content-center text-white">
        <div class="row mb-3 pt-2">
            <div class="fw-bold text-center">
                <a href="${contextPath}/Main.do" class="link">Main</a>
                <span class="px-2">|</span>
                <a href="#top" class="link">Back to Top</a>
            </div>
        </div>
        <table class="botTable table-borderless mt-4">
            <tr>
                <th colspan="2" class="fst-italic">© silver / EUNSEO CHO</th>
            </tr>
            <tr>
                <th class="text-white pe-3"><span>Contact</span></th>
                <td class="text-white"><span>bli583@naver.com</span></td>
            </tr>
            <tr>
                <th class="text-white"><span>Blog</span></th>
                <td class="text-white">
                    <a href="https://codingstudy-silver.tistory.com/" class="link">
                    silver의 개발자 도전 log
                    </a>
                </td>
            </tr>
        </table>
    </div>