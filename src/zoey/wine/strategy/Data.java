package zoey.wine.strategy;

import java.util.*;

import zoey.wine.database.*;

/**
 * @author Zoey
 * 
 */
public class Data {
	// 存放训练数据
	private List<List<Double>> trainData = new ArrayList<List<Double>>();
	private int trainNum = 0;
	// 存放测试数据
	private List<List<Double>> testData = new ArrayList<List<Double>>();
	private int testNum = 0;
	private int dimension = 0;

	public Data() {
		List<List<Double>> allData = DB.getDataList();
		int dataSize = allData.size();
		trainData = allData.subList(0, dataSize / 3 * 2 + 1);
		testData = allData.subList(dataSize / 3 * 2 + 1, allData.size());
		trainNum = trainData.size();
		testNum = testData.size();
		dimension = allData.get(0).size();
	}

	public Data(int first) {
		List<List<Double>> allData = DB.getDataList();
		int dataSize = allData.size();
		testData = allData.subList(first, first + dataSize / 10);
		trainData.addAll(allData);
		trainData.removeAll(testData);
		testNum = testData.size();
		System.out.println(testNum);
		trainNum = trainData.size();
		dimension = allData.get(0).size();
	}

	public static Map<Integer, Integer> classOfData(List<List<Integer>> list) {
		Map<Integer, Integer> classes = new HashMap<Integer, Integer>();
		Integer c;
		for (int i = 0; i < list.size(); i++) {
			c = list.get(i).get(0);
			if (classes.containsKey(c)) {
				classes.put(c, classes.get(c) + 1);
			} else {
				classes.put(c, 1);
			}
		}
		return classes;
	}

	public static Integer maxClass(Map<Integer, Integer> classes) {
		Integer maxC = 0, max = -1;
		for (Integer key : classes.keySet()) {
			Integer val = classes.get(key);
			if (val > max) {
				max = val;
				maxC = key;
			}
		}
		return maxC;
	}

	/**
	 * 最小-最大规范化
	 * 
	 * @param data
	 *            要规范化的数据
	 */
	public void minMaxDataFormat(List<List<Double>> data) {
		List<Double[]> minmax = getMinMax(data);
		for (int i = 0; i < data.size(); i++) {
			for (int j = 1; j < dimension; j++) {
				data.get(i).set(
						j,
						(data.get(i).get(j) - minmax.get(j)[0])
								/ (minmax.get(j)[1] - minmax.get(j)[0]));
			}
		}
	}

	public List<List<Integer>> discretization(List<List<Double>> data) {
		List<Double[]> minmax = getMinMax(data);
		List<List<Integer>> result = new ArrayList<List<Integer>>();
		for (int i = 0; i < dimension; i++) {
			if (minmax.get(i)[0] > 100 && minmax.get(i)[1] > 1000) { // 如果最小值大于100且最大值大于1000，则所有值除以100
				for (int j = 0; j < data.size(); j++) {
					data.get(j).set(i, data.get(j).get(i) / 100);
				}
			} else if (minmax.get(i)[0] > 10 && minmax.get(i)[1] > 100) { // 如果最小值大于10且最大值大于100，则所有值除以10
				for (int j = 0; j < data.size(); j++) {
					data.get(j).set(i, data.get(j).get(i) / 10);
				}
			}
		}
		// 对所有值取整
		for (int j = 0; j < data.size(); j++) {
			List<Integer> list = new ArrayList<Integer>();
			for (int i = 0; i < dimension; i++) {
				list.add(Arith.convertsToInt(data.get(j).get(i)));
			}
			result.add(list);
		}
		return result;
	}

	public List<Double[]> getMinMax(List<List<Double>> data) {
		List<Double[]> minmax = new ArrayList<Double[]>();
		List<Double> firstTuple = data.get(0);
		for (int j = 0; j < dimension; j++) {
			minmax.add(new Double[] { firstTuple.get(j), firstTuple.get(j) });
		}
		for (int i = 1; i < data.size(); i++) {
			for (int j = 0; j < dimension; j++) {
				double tuple = data.get(i).get(j);
				if (tuple < minmax.get(j)[0]) {
					minmax.get(j)[0] = tuple;
				} else if (tuple > minmax.get(j)[1]) {
					minmax.get(j)[1] = tuple;
				}
			}
		}
		return minmax;
	}

	public List<List<Double>> getTrainData() {
		return trainData;
	}

	public void setTrainData(List<List<Double>> trainData) {
		this.trainData = trainData;
	}

	public int getTrainNum() {
		return trainNum;
	}

	public void setTrainNum(int trainNum) {
		this.trainNum = trainNum;
	}

	public List<List<Double>> getTestData() {
		return testData;
	}

	public void setTestData(List<List<Double>> testData) {
		this.testData = testData;
	}

	public int getTestNum() {
		return testNum;
	}

	public void setTestNum(int testNum) {
		this.testNum = testNum;
	}

}
