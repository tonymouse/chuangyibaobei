package com.cybb.util;

import java.util.ArrayList;
import java.util.List;


public class ListUtil {
	
	public static List checkNullOrEmpty(List sourceList){
		if (sourceList == null)
			return new ArrayList<>();
		else return sourceList;
	}

}
