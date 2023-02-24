package com.study.hard.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 로그인처리를 담당하는 인터셉터
public class AuthInterceptor extends HandlerInterceptorAdapter {

	// preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// exclude-mapping 대신, 요청된 url
		String requestUrl = request.getRequestURI().toString();
		System.out.println("화면 -> 컨트롤러 이동");
		// 하단의 Url 체크를 통해, login 페이지는 예외처리를 해줘야 무한 리디렉션에서 벗어날 수 있다.
		// 로그인 창으로 가는 경우(="/"), 로그인하는 경우(="/login")의 경우는 권한체크를 하지 않음
		if (requestUrl.equals("/loginForm") || requestUrl.equals("/login") || requestUrl.equals("/logout")
				|| requestUrl.equals("/custList") || requestUrl.equals("/custNew")
				|| requestUrl.equals("/getLoginInfo")) {
			return true;
		}

		// session 객체를 가져옴
		HttpSession session = request.getSession();
		// login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		String s = (String) session.getAttribute("로그인"); // 로그인시 세션에 넣어준 값을 체크
		System.out.println("로그인됨 : " + s);
		if (s == null || !s.equals("O")) { // 로그인시 세션에 넣은 값이 없으면
			// 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
			response.sendRedirect("/loginForm");
			return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
		}

		session.setMaxInactiveInterval(60 * 60 * 24); // 세션만료60분
		// preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
		// 따라서 true로하면 컨트롤러 uri로 가게 됨.
		return true;
	}

	// 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("컨트롤러 -> 화면 이동");
		super.postHandle(request, response, handler, modelAndView);
	}
}