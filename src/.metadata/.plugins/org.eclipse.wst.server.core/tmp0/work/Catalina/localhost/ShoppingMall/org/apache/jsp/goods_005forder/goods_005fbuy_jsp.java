/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.73
 * Generated at: 2023-04-09 08:15:08 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.goods_005forder;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import net.member.db.MemberBean;
import net.basket.db.BasketBean;
import net.goods.db.GoodsBean;

public final class goods_005fbuy_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("net.member.db.MemberBean");
    _jspx_imports_classes.add("net.goods.db.GoodsBean");
    _jspx_imports_classes.add("net.basket.db.BasketBean");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	MemberBean member = (MemberBean) request.getAttribute("member");
	String ordertype = (String) request.getAttribute("ordertype");
	List orderinfo = null;
	List basketlist = null;
	List goodslist=null;
	
	if (ordertype.equals("goods")) {
		orderinfo = (ArrayList) request.getAttribute("orderinfo");
	} else {
		basketlist = (ArrayList) request.getAttribute("basketlist");
		goodslist = (ArrayList) request.getAttribute("goodslist");
	}
	//System.out.println(basketlist.size());
	//System.out.println(goodslist.size());

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>쇼핑몰</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<table width=\"960\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">\r\n");
      out.write("<tr>\r\n");
      out.write("	<td colspan=2 align=right>\r\n");
      out.write("	<!-- 주문 페이지 -->\r\n");
      out.write("	<form action=\"./OrderAdd.or\" method=\"post\" name=\"orderform\">\r\n");
      out.write("	<input type=\"hidden\" name=\"ordertype\" value=\"");
      out.print(ordertype);
      out.write("\"> \r\n");
      out.write("	");
if (ordertype.equals("goods")) {
      out.write("\r\n");
      out.write("	<input type=\"hidden\" name=\"goodsnum\" value=\"");
      out.print(orderinfo.get(0));
      out.write("\">\r\n");
      out.write("	<input type=\"hidden\" name=\"goodsname\" value=\"");
      out.print(orderinfo.get(1));
      out.write("\">\r\n");
      out.write("	<input type=\"hidden\" name=\"goodsamount\" value=\"");
      out.print(orderinfo.get(2));
      out.write("\">\r\n");
      out.write("	<input type=\"hidden\" name=\"goodscolor\" value=\"");
      out.print(orderinfo.get(3));
      out.write("\">\r\n");
      out.write("	<input type=\"hidden\" name=\"goodssize\" value=\"");
      out.print(orderinfo.get(4));
      out.write("\">\r\n");
      out.write("	<input type=\"hidden\" name=\"goodsprice\" value=\"");
      out.print(orderinfo.get(5));
      out.write("\">\r\n");
      out.write("	");
}
      out.write("\r\n");
      out.write("	<input type=\"hidden\" name=\"memberid\" value=\"");
      out.print(member.getMEMBER_ID() );
      out.write("\">\r\n");
      out.write("	\r\n");
      out.write("	<!-- 주문 상세내역 -->\r\n");
      out.write("	<table border=0 cellspacing=1 cellpadding=0 width=80%>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<p align=left><b><font size=2>주문 상세내역</font></b></p>\r\n");
      out.write("		</tr>\r\n");
      out.write("		\r\n");
      out.write("		<tr align=center height=20>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt; font-weight: bold;\">사진</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt; font-weight: bold;\">상품명</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt; font-weight: bold;\">수량</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt; font-weight: bold;\">색깔</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt; font-weight: bold;\">사이즈</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt; font-weight: bold;\">가격</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("		");

			if (ordertype.equals("goods")) {
		
      out.write("\r\n");
      out.write("		<tr align=center height=20>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 7pt;\"><img\r\n");
      out.write("			src=\"./upload/");
      out.print(orderinfo.get(6) );
      out.write("\" width=50 height=50></td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt;\">");
      out.print(orderinfo.get(1));
      out.write("</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt;\">");
      out.print(orderinfo.get(2));
      out.write("</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt;\">");
      out.print(orderinfo.get(3));
      out.write("</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt;\">");
      out.print(orderinfo.get(4));
      out.write("</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt;\">");
      out.print(orderinfo.get(5));
      out.write("</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("		");

			} else {
				for (int i = 0; i < basketlist.size(); i++) {
					BasketBean basket = (BasketBean) basketlist.get(i);
					GoodsBean goods = (GoodsBean) goodslist.get(i);
		
      out.write("\r\n");
      out.write("		<tr align=center height=20>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 7pt;\">\r\n");
      out.write("			<img src=\"./upload/");
      out.print(goods.getGOODS_IMAGE().split(",")[0] );
      out.write("\" \r\n");
      out.write("				width=50 height=50>\r\n");
      out.write("		</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt;\">\r\n");
      out.write("			");
      out.print(goods.getGOODS_NAME());
      out.write("\r\n");
      out.write("		</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt;\">\r\n");
      out.write("			");
      out.print(basket.getBASKET_GOODS_AMOUNT());
      out.write("\r\n");
      out.write("		</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt;\">\r\n");
      out.write("			");
      out.print(basket.getBASKET_GOODS_COLOR());
      out.write("\r\n");
      out.write("		</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt;\">\r\n");
      out.write("			");
      out.print(basket.getBASKET_GOODS_SIZE());
      out.write("\r\n");
      out.write("		</td>\r\n");
      out.write("		<td style=\"font-family: Tahoma; font-size: 8pt;\">\r\n");
      out.write("			");
      out.print(goods.getGOODS_PRICE());
      out.write("\r\n");
      out.write("		</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("		");

				}
			}
		
      out.write("\r\n");
      out.write("	</table>\r\n");
      out.write("\r\n");
      out.write("	<table width=80% border=0 cellpadding=\"0\" cellspacing=\"1\">\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td height=10>\r\n");
      out.write("			<td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td height=10>\r\n");
      out.write("			<td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td><b><font size=2>주문자 정보</font></b></td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\" width=80 height=24\r\n");
      out.write("				bgcolor=\"f7f7f7\">이름</td>\r\n");
      out.write("			<td width=320 height=24>\r\n");
      out.write("				<font size=2>");
      out.print(member.getMEMBER_NAME());
      out.write("</font>\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\" height=24\r\n");
      out.write("				bgcolor=\"f7f7f7\">휴대폰</td>\r\n");
      out.write("			<td width=320 height=24>\r\n");
      out.write("				<font size=2>");
      out.print(member.getMEMBER_MOBILE());
      out.write("</font>\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\" height=24\r\n");
      out.write("				bgcolor=\"f7f7f7\">이메일 주소</td>\r\n");
      out.write("			<td width=320 height=24>\r\n");
      out.write("				<font size=2>");
      out.print(member.getMEMBER_EMAIL());
      out.write("</font>\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("	</table>\r\n");
      out.write("\r\n");
      out.write("	<table width=80% border=0 cellpadding=\"0\" cellspacing=\"1\">\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td height=10>\r\n");
      out.write("			<td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td height=10>\r\n");
      out.write("			<td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td><b><font size=2>배송지 정보</font></b></td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr height=20>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\" width=130 height=24\r\n");
      out.write("				bgcolor=\"f7f7f7\">받는사람</td>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\">\r\n");
      out.write("				<input type=\"text\" name=\"ORDER_RECEIVE_NAME\" size=12\r\n");
      out.write("				value=\"");
      out.print(member.getMEMBER_NAME() );
      out.write("\">\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr height=23>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\" width=130 height=24\r\n");
      out.write("				bgcolor=\"f7f7f7\">집 전화</td>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\">\r\n");
      out.write("				<input type=\"text\" name=\"ORDER_RECEIVE_PHONE\" size=15\r\n");
      out.write("				value=\"");
      out.print(member.getMEMBER_PHONE() );
      out.write("\">\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr height=20>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\" width=130 height=24\r\n");
      out.write("				bgcolor=\"f7f7f7\">휴대폰</td>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\">\r\n");
      out.write("				<input type=\"text\" name=\"ORDER_RECEIVE_MOBILE\" size=15\r\n");
      out.write("				value=\"");
      out.print(member.getMEMBER_MOBILE() );
      out.write("\">\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr height=20>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\" width=130 height=24\r\n");
      out.write("				bgcolor=\"f7f7f7\">배송지 우편번호</td>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\">\r\n");
      out.write("				<input type=\"text\" name=\"ORDER_RECEIVE_ZIPCODE\" size=7\r\n");
      out.write("				value=\"");
      out.print(member.getMEMBER_ZIPCODE() );
      out.write("\">\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr height=20>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\" width=130 height=24\r\n");
      out.write("				bgcolor=\"f7f7f7\">배송지 주소</td>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\">\r\n");
      out.write("				<input type=\"text\" name=\"ORDER_RECEIVE_ADDR1\" size=50\r\n");
      out.write("				value=\"");
      out.print(member.getMEMBER_ADDR1() );
      out.write("\"></td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr height=20>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\" width=130 height=24\r\n");
      out.write("				bgcolor=\"f7f7f7\">배송지 나머지 주소</td>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\">\r\n");
      out.write("				<input type=\"text\" name=\"ORDER_RECEIVE_ADDR2\" size=50\r\n");
      out.write("				value=\"");
      out.print(member.getMEMBER_ADDR2() );
      out.write("\">\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr height=20>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\" width=130 height=24\r\n");
      out.write("				bgcolor=\"f7f7f7\">기타 요구사항</td>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\">\r\n");
      out.write("			<textarea name=\"ORDER_MEMO\" cols=60 rows=12></textarea>\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("	</table>\r\n");
      out.write("\r\n");
      out.write("	<table width=80% border=0 cellpadding=\"0\" cellspacing=\"1\">\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td height=10>\r\n");
      out.write("			<td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td height=10>\r\n");
      out.write("			<td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td><b><font size=2>결제 정보</font></b></td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"font-family: Tahoma; font-size: 8pt;\" width=200 height=24\r\n");
      out.write("				bgcolor=\"f7f7f7\">입금자명(온라인입금일 경우) :</td>\r\n");
      out.write("			<td width=320 height=24>\r\n");
      out.write("			<input type=\"text\" name=\"ORDER_TRADE_PAYER\"\r\n");
      out.write("				size=20 value=\"");
      out.print(member.getMEMBER_NAME() );
      out.write("\">\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td style=\"background-color: #F0F0F0; height: 1px;\" colspan=6>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td align=center style=\"background-color: #F0F0F0; height: 1px;\"\r\n");
      out.write("				colspan=6>\r\n");
      out.write("				<input type=submit value=\"주문\">&nbsp;\r\n");
      out.write("				<input type=button value=\"취소\">\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("	</table>\r\n");
      out.write("	</form>\r\n");
      out.write("	<!-- 주문 페이지 -->\r\n");
      out.write("	</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}