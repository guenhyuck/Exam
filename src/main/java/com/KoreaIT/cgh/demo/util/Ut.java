package com.KoreaIT.cgh.demo.util;

public class Ut {

	public static boolean empty(Object obj) {

		if (obj == null) {
			return true;
		}

		if (obj instanceof String == false) {
			return true;
		}

		String str = (String) obj;

		return str.trim().length() == 0;
	}

	public static String f(String format, Object... args) {
		return String.format(format, args);
	}

}








//empty(Object obj) 메서드
//
//empty 메서드는 인자로 전달된 객체가 비어있는지를 검사하는 메서드입니다.
//인자로 전달된 객체가 null이거나 문자열이 아닌 경우에는 비어있다고 판단합니다. 
//문자열인 경우, trim() 메서드를 사용하여 공백을 제거한 후 문자열의 길이가 0인지 검사하여 비어있는지를 판단합니다.
//
//f(String format, Object... args) 메서드
//
//f 메서드는 String.format() 메서드를 호출하는 간편한 방법을 제공하는 메서드입니다. 
//첫 번째 인자로는 포맷 문자열(format string)을 전달하고, 두 번째 인자로는 가변인자(varargs)를 전달합니다. 
//String.format() 메서드는 첫 번째 인자로 전달된 포맷 문자열에 대응되는 값을 두 번째 인자로 전달된 가변인자에서 가져와 문자열을 생성합니다. 
//생성된 문자열을 f 메서드는 리턴합니다.
//
//예를 들어, Ut.f("Hello, %s!", "world") 코드는 "Hello, world!" 문자열을 생성합니다. 
//첫 번째 인자인 포맷 문자열에서 %s 부분이 두 번째 인자로 전달된 "world" 문자열로 대체되어 생성된 결과입니다.