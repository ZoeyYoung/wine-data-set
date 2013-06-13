package zoey.wine.strategy;

import java.util.*;

import javax.servlet.http.*;

public class KNN implements Strategy {
	private final Data data;
	List<List<Double>> trainData = new ArrayList<List<Double>>();
	List<List<Double>> testData = new ArrayList<List<Double>>();
	int[][] result;
	// 保存正确率，错误率
	private final ModelAssessment ma = new ModelAssessment();

	/**
	 * 设置优先级队列的比较函数，距离越大，优先级越高
	 */

	public KNN() {
		data = new Data();
		result = new int[data.getTestNum()][2];
		data.minMaxDataFormat(data.getTrainData());
		data.minMaxDataFormat(data.getTestData());
	}

	public KNN(Data data) {
		this.data = data;
		result = new int[data.getTestNum()][2];
		data.minMaxDataFormat(data.getTrainData());
		data.minMaxDataFormat(data.getTestData());
	}

	private final Comparator<KNNNode> comparator = new Comparator<KNNNode>() {
		@Override
		public int compare(KNNNode o1, KNNNode o2) {
			if (o1.getDistance() >= o2.getDistance()) {
				return 1;
			} else {
				return 0;
			}
		}
	};

	/**
	 * 计算测试元组与训练元组之前的距离
	 * 
	 * @param test
	 *            测试元组
	 * @param trainTuple
	 *            训练元组
	 * @return 距离值
	 */
	public double getDistance(List<Double> test, List<Double> trainTuple) {
		double distance = 0.00;
		for (int i = 0; i < 13; i++) {
			distance += (test.get(i) - trainTuple.get(i))
					* (test.get(i) - trainTuple.get(i));
		}
		return distance;
	}

	/**
	 * 执行KNN算法，获取测试元组的类别
	 * 
	 * @param list
	 *            训练数据集
	 * @param test
	 *            测试元组
	 * @param k
	 *            设定的K值
	 * @return 测试元组的类别
	 */
	public String knn(List<List<Double>> list, List<Double> test, int k) {
		PriorityQueue<KNNNode> pq = new PriorityQueue<KNNNode>(k, comparator);
		for (int i = 0; i < k; i++) {
			List<Double> trainTuple = list.get(i);
			Double c = trainTuple.get(0);
			KNNNode node = new KNNNode(i, getDistance(test, trainTuple), c);
			pq.add(node);
		}
		for (int i = 0; i < list.size(); i++) {
			List<Double> t = list.get(i);
			double distance = getDistance(test, t);
			KNNNode top = pq.peek();
			if (top.getDistance() > distance) {
				pq.remove();
				pq.add(new KNNNode(i, distance, t.get(0)));
			}
		}
		return getMostClass(pq);
	}

	/**
	 * 获取所得到的k个最近邻元组的多数类
	 * 
	 * @param pq
	 *            存储k个最近近邻元组的优先级队列
	 * @return 多数类的名称
	 */
	private String getMostClass(PriorityQueue<KNNNode> pq) {
		Map<Double, Integer> classCount = new HashMap<Double, Integer>();
		for (int i = 0; i < pq.size(); i++) {
			KNNNode node = pq.remove();
			double c = node.getC();
			if (classCount.containsKey(c)) {
				classCount.put(c, classCount.get(c) + 1);
			} else {
				classCount.put(c, 1);
			}
		}
		int maxIndex = -1;
		int maxCount = 0;
		Object[] classes = classCount.keySet().toArray();
		for (int i = 0; i < classes.length; i++) {
			if (classCount.get(classes[i]) > maxCount) {
				maxIndex = i;
				maxCount = classCount.get(classes[i]);
			}
		}
		return classes[maxIndex].toString();
	}

	public void processAlgorithm() {
		List<List<Double>> testData = data.getTestData();
		int testNum = data.getTestNum();
		long begin = System.currentTimeMillis();
		for (int i = 0; i < testNum; i++) {
			List<Double> test = testData.get(i);
			result[i][0] = Arith.convertsToInt(test.get(0));
			result[i][1] = Math.round(Float.parseFloat((knn(
					data.getTrainData(), test, 3))));
			if (result[i][0] != result[i][1]) {
				ma.setWrong(ma.getWrong() + 1);
			}
		}
		long end = System.currentTimeMillis();
		ma.setTime(begin, end);
		ma.setAccuracyRate(ma.getWrong(), testNum);
		ma.setErrorRate(ma.getWrong(), testNum);
	}

	@Override
	public void algorithm(HttpServletRequest request) {
		KNN knn0 = new KNN();
		knn0.processAlgorithm();
		request.setAttribute("time", knn0.ma.getTime());
		request.setAttribute("KNNResult", knn0.result);
		request.setAttribute("accuracyRate", knn0.ma.getAccuracyRate());
		request.setAttribute("errorRate", knn0.ma.getErrorRate());
		double avgAccruacyRate = 0, avgErrorRate = 0;
		for (int i = 0; i < 10; i++) {
			KNN knn = new KNN(new Data(i));
			knn.processAlgorithm();
			avgAccruacyRate += knn.ma.getAccuracyRate();
			avgErrorRate += knn.ma.getErrorRate();
		}
		request.setAttribute("avgAccuracyRate", avgAccruacyRate / 10);
		request.setAttribute("avgErrorRate", avgErrorRate / 10);
	}
}

class KNNNode {
	private int index; // 元组标号
	private double distance; // 与测试元组的距离
	private double c;

	public KNNNode(int index, double distance, Double c) {
		this.index = index;
		this.distance = distance;
		this.c = c;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	public double getC() {
		return c;
	}

	public void setC(int c) {
		this.c = c;
	}

}