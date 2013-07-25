<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de contas</title>
</head>
<body>

<table>
		<tr>
			<td>Código</td>
			<td>Descrição</td>
			<td>Valor</td>
			<td>Tipo</td>
			<td>Paga?</td>
			<td>Data Pagamento</td>
		</tr>
		<c:forEach items="${contas}" var="conta">
			<tr>
				<td>${conta.id}</td>
				<td>${conta.descricao}</td>
				<td>${conta.valor}</td>
				<td>${conta.tipo}</td>
				<td>
					<c:if test="${conta.paga eq false}"> Nao paga</c:if> 
					<c:if test="${conta.paga eq true}"> Paga</c:if>
				</td>
				<td><fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy"/></td>
				<td>
					<a href="removeConta?id=${conta.id}">Excluir</a>
					<a href="mostraConta?id=${conta.id}">Alterar</a>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>