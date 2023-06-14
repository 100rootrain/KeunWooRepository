package com.study.hard.controller;
//
//public class Test {
//
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//		int p = 2;
//		int n = 3;
//		while (true) {
//			double t = Math.sqrt(n);
//			int m = (int)t;
//			System.out.println("p : " + p);
//			System.out.println("n : " + n);
//			System.out.println("m : " + m );
//			for(int i=2; i<=m; i++) {
//				System.out.println("i : " + i );
//				int r = n%i;
//				//System.out.println("p : "+ p+", n : "+n+ ", m : "+m+", i :"+i+", r : "+r);
//				System.out.println("r : " + r );
//				System.out.println("-----------------");
//				if(r==0)
//					break;
//				
//				if(i==m)
//					p=n;
//				
//				
//			}
//			n++;
//			if (n>100)
//				break;
//			
//		}
////		System.out.printf("%d\n",p);
//	}
//
//}
abstract class Vehicle{
	String name;
	abstract public String getName(String val);
	public String getName() {
		return "Vehicle name : " + name;
	}
	
	
}

class Car extends Vehicle{
	private String name;
	private String val;
	public Car(String val) {
		name = super.name = val;
	}
	public String getName(String val) {
		return super.getName() + ", Car name : " + val;
	}
	public String getName(byte[] val) {
		return "Car name : " + val;
	}
	public String getName() {
		return "자식의 getName : " + name;
	}
}


public class Test {

	public static void main(String[] args) {
		Vehicle obj = new Car("Spark");
		System.out.println("1 : "+obj.getName());
		System.out.println("2 : "+obj.getName("Cruze"));
	}
}

