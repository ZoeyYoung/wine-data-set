package zoey.wine.database;

import java.io.*;
import java.util.*;

import zoey.wine.bean.*;

public class DB {
	private final static String filename = Thread.currentThread()
			.getContextClassLoader().getResource("").getPath()
			+ "wine.data";

	public static List<WineBean> getData() {
		List<WineBean> list = new ArrayList<WineBean>();
		WineBean wine = null;
		File file = new File(filename);
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(file));
			String tempString = null;
			String[] tempList = null;
			// 一次读入一行，直到读入null为文件结束
			while ((tempString = reader.readLine()) != null) {
				// 显示行号
				tempList = tempString.split(",");
				wine = new WineBean();
				wine.setClasss(Integer.parseInt(tempList[0]));
				wine.setAlcohol(Double.parseDouble(tempList[1]));
				wine.setMalic_acid(Double.parseDouble(tempList[2]));
				wine.setAsh(Double.parseDouble(tempList[3]));
				wine.setAlcalinity_of_ash(Double.parseDouble(tempList[4]));
				wine.setMagnesium(Double.parseDouble(tempList[5]));
				wine.setTotal_phenols(Double.parseDouble(tempList[6]));
				wine.setFlavanoids(Double.parseDouble(tempList[7]));
				wine.setNonflavanoid_phenols(Double.parseDouble(tempList[8]));
				wine.setProanthocyanins(Double.parseDouble(tempList[9]));
				wine.setColor_intensity(Double.parseDouble(tempList[10]));
				wine.setHue(Double.parseDouble(tempList[11]));
				wine.setOD280_OD315_of_diluted_wines(Double
						.parseDouble(tempList[12]));
				wine.setProline(Double.parseDouble(tempList[13]));
				list.add(wine);
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}
		return list;
	}

	public static List<List<Double>> getDataList() {
		List<List<Double>> tupleList = new ArrayList<List<Double>>();
		List<Double> wine = null;
		File file = new File(filename);
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(file));
			String tempString = null;
			String[] tempList = null;
			// 一次读入一行，直到读入null为文件结束
			while ((tempString = reader.readLine()) != null) {
				tempList = tempString.split(",");
				wine = new ArrayList<Double>();
				wine.add(Double.parseDouble(tempList[0]));
				wine.add(Double.parseDouble(tempList[1]));
				wine.add(Double.parseDouble(tempList[2]));
				wine.add(Double.parseDouble(tempList[3]));
				wine.add(Double.parseDouble(tempList[4]));
				wine.add(Double.parseDouble(tempList[5]));
				wine.add(Double.parseDouble(tempList[6]));
				wine.add(Double.parseDouble(tempList[7]));
				wine.add(Double.parseDouble(tempList[8]));
				wine.add(Double.parseDouble(tempList[9]));
				wine.add(Double.parseDouble(tempList[10]));
				wine.add(Double.parseDouble(tempList[11]));
				wine.add(Double.parseDouble(tempList[12]));
				wine.add(Double.parseDouble(tempList[13]));
				tupleList.add(wine);
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}
		Collections.shuffle(tupleList);
		return tupleList;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		List<List<Double>> lists = DB.getDataList();
		for (List<Double> list : lists) {
			for (Double d : list) {
				System.out.print(d + "\t");
			}
			System.out.println();
		}
	}

}
