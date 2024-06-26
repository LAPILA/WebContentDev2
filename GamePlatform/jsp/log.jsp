<%@ page language="java" import="java.io.*, java.time.*, javax.servlet.*, javax.servlet.http.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%! 
    public void writeLog(String message, HttpServletRequest request, HttpSession session) {

        
        try 
		{
			// 로그 파일 : ex) /var/lib/tomcat8/webapps/ROOT/book/jsp/log.txt, /usr/local/tomcat/webapps/ROOT/book/jsp/log.txt
			final String logFileName = "./log.txt";
			BufferedWriter writer = new BufferedWriter( new FileWriter( logFileName, true ) );

            writer.append("Tlqlf!");

			// 로그 데이터 출력
			writer.append( "\nTime:\t" + LocalDate.now() + " " + LocalTime.now() 	// 접속 시간	
				+ "\tSessionID:\t" + session.getId()				// 접속 ID	
				+ "\tURI:\t" + request.getRequestURI()				// 현재 페이지 
				+ "\tPrevious:\t" + request.getHeader("referer") 		// 접속 경로(이전페이지)
				+ "\tBrowser:\t" + request.getHeader("User-Agent") 		// 접속 브라우저	
				+ "\tMessage:\t" + message );

			writer.close();
            System.out.println("로그 작성 완료: " + message);
		} 
		// 예외 처리
		catch (IOException e) 
		{
			e.printStackTrace();
            System.out.println("IOException 발생: " + e.getMessage());
		}
    }

%>

<%
    request.setCharacterEncoding("UTF-8");
    writeLog("메시지", request, session); // 이 부분에서 writeLog 메서드 호출
%>