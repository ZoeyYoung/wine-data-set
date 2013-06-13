package zoey.wine.strategy;

import java.util.*;

import javax.servlet.http.*;

public class NaiveBayes implements Strategy {
	// 初始化测试数据
	List<List<Integer>> trainData = new ArrayList<List<Integer>>();
	List<List<Integer>> testData = new ArrayList<List<Integer>>();
	private int trainNum = 0;
	private int testNum = 0;
	// 存放先验概率：P(Ci)
	Map<Integer, Integer> classes = new HashMap<Integer, Integer>();
	public double[] priorProbability;
	// 存放每个属性Xi在类别Ci中发生的概率：P(Xi|Ci)
	public List<Map<Integer, Double>> pXiC1Map = new ArrayList<Map<Integer, Double>>();
	public List<Map<Integer, Double>> pXiC2Map = new ArrayList<Map<Integer, Double>>();
	public List<Map<Integer, Double>> pXiC3Map = new ArrayList<Map<Integer, Double>>();
	// 存放后验概率
	public Double[][] pCiTi;
	// 保存正确率，错误率
	private final ModelAssessment ma = new ModelAssessment();

	public NaiveBayes() {
		Data data = new Data();
		priorProbability = new double[] { 0, 0, 0 };
		// 初始化
		for (int i = 0; i <= 13; i++) {
			pXiC1Map.add(i, new HashMap<Integer, Double>());
			pXiC2Map.add(i, new HashMap<Integer, Double>());
			pXiC3Map.add(i, new HashMap<Integer, Double>());
		}
		pCiTi = new Double[data.getTestNum()][5];
		trainData = data.discretization(data.getTrainData());
		testData = data.discretization(data.getTestData());
		trainNum = data.getTrainNum();
		testNum = data.getTestNum();
	}

	public NaiveBayes(Data data) {
		priorProbability = new double[] { 0, 0, 0 };
		// 初始化
		for (int i = 0; i <= 13; i++) {
			pXiC1Map.add(i, new HashMap<Integer, Double>());
			pXiC2Map.add(i, new HashMap<Integer, Double>());
			pXiC3Map.add(i, new HashMap<Integer, Double>());
		}
		pCiTi = new Double[data.getTestNum()][5];
		trainData = data.discretization(data.getTrainData());
		testData = data.discretization(data.getTestData());
		trainNum = data.getTrainNum();
		testNum = data.getTestNum();
	}

	// 求得P(C1)、P(C2)、P(C3)
	public double[] getPriorProbability() {
		classes = Data.classOfData(trainData);
		priorProbability[0] = (double) classes.get(1) / (double) trainNum;
		priorProbability[1] = (double) classes.get(2) / (double) trainNum;
		priorProbability[2] = (double) classes.get(3) / (double) trainNum;
		return priorProbability;
	}

	// 求P(Xi|Ci)
	public void getPXiCi() {
		List<Integer> wine = new ArrayList<Integer>();
		Integer classs;
		for (int i = 0; i < trainNum; i++) {
			wine = trainData.get(i);
			classs = wine.get(0);
			if (classs == 1) {
				putXiNumUnderCi(pXiC1Map, wine);
			} else if (classs == 2) {
				putXiNumUnderCi(pXiC2Map, wine);
			} else if (classs == 3) {
				putXiNumUnderCi(pXiC3Map, wine);
			}
		}
		// 必须先调用getPriorProbability()求得c1、c2、c3，使用keySet()效率可能比较低，偷懒一下
		for (int i = 1; i <= 13; i++) {
			for (Integer xi : pXiC1Map.get(i).keySet()) {
				pXiC1Map.get(i).put(xi,
						pXiC1Map.get(i).get(xi) / classes.get(1));
			}
			for (Integer xi : pXiC2Map.get(i).keySet()) {
				pXiC2Map.get(i).put(xi,
						pXiC2Map.get(i).get(xi) / classes.get(2));
			}
			for (Integer xi : pXiC3Map.get(i).keySet()) {
				pXiC3Map.get(i).put(xi,
						pXiC3Map.get(i).get(xi) / classes.get(3));
			}
		}
	}

	// 求后验概率P(Ci|Ti)
	public void posteriorDistribution() {
		double tiC1 = 0, tiC2 = 0, tiC3 = 0, pTi = 0, pC1Ti, pC2Ti, pC3Ti;
		System.out.println(testNum);
		for (int i = 0; i < testNum; i++) {
			System.out.println(i);
			tiC1 = getPTiCi(pXiC1Map, testData.get(i));
			tiC2 = getPTiCi(pXiC2Map, testData.get(i));
			tiC3 = getPTiCi(pXiC3Map, testData.get(i));
			pTi = tiC1 * priorProbability[0] + tiC2 * priorProbability[1]
					+ tiC3 * priorProbability[2];
			pC1Ti = tiC1 * priorProbability[0] / pTi;
			pC2Ti = tiC2 * priorProbability[1] / pTi;
			pC3Ti = tiC3 * priorProbability[2] / pTi;
			int max = 1;
			if (pC2Ti >= pC1Ti && pC2Ti >= pC3Ti) {
				max = 2;
			} else if (pC3Ti >= pC1Ti && pC3Ti >= pC2Ti) {
				max = 3;
			}
			pCiTi[i][0] = testData.get(i).get(0) + 0.0;
			pCiTi[i][1] = pC1Ti;
			pCiTi[i][2] = pC2Ti;
			pCiTi[i][3] = pC3Ti;
			pCiTi[i][4] = (double) max;
			if (testData.get(i).get(0) != max) {
				ma.setWrong(ma.getWrong() + 1);
			}
			ma.setAccuracyRate(ma.getWrong(), testNum);
			ma.setErrorRate(ma.getWrong(), testNum);
		}
	}

	// 计算在Ci类下Xi的数目
	public void putXiNumUnderCi(List<Map<Integer, Double>> pXiC1Map2,
			List<Integer> wine) {
		for (int i = 1; i <= 13; i++) {
			Map<Integer, Double> map = pXiC1Map2.get(i);
			if (map.containsKey(wine.get(i))) {
				map.put(wine.get(i), map.get(wine.get(i)) + 1);
			} else {
				map.put(wine.get(i), 1.0);
			}
		}
	}

	// 计算P(Ti|Ci),当不存在P(Xi|Ci)时概率取0.001(随机取的，应该需要修改)
	public double getPTiCi(List<Map<Integer, Double>> pXiCiMap,
			List<Integer> list) {
		double t = 1.0;
		for (int i = 1; i <= 13; i++) {
			Double temp = pXiCiMap.get(i).get(list.get(i));
			if (temp == null) {
				temp = 0.001;
			}
			t *= temp;
		}
		return t;
	}

	public void processAlgorithm() {
		long begin = System.currentTimeMillis();
		getPriorProbability();
		getPXiCi();
		long end = System.currentTimeMillis();
		ma.setTime(begin, end);
		posteriorDistribution();
	}

	@Override
	public void algorithm(HttpServletRequest request) {
		NaiveBayes nb0 = new NaiveBayes();
		nb0.processAlgorithm();
		request.setAttribute("priorProbabilitys", nb0.priorProbability);
		request.setAttribute("PXiC1", nb0.pXiC1Map);
		request.setAttribute("PXiC2", nb0.pXiC2Map);
		request.setAttribute("PXiC3", nb0.pXiC3Map);
		request.setAttribute("PCiTi", nb0.pCiTi);
		request.setAttribute("accuracyRate", nb0.ma.getAccuracyRate());
		request.setAttribute("errorRate", nb0.ma.getErrorRate());
		request.setAttribute("time", nb0.ma.getTime());
		double avgAccruacyRate = 0, avgErrorRate = 0;
		for (int i = 0; i < 10; i++) {
			NaiveBayes nb = new NaiveBayes(new Data(i));
			nb.processAlgorithm();
			avgAccruacyRate += nb.ma.getAccuracyRate();
			avgErrorRate += nb.ma.getErrorRate();
		}
		request.setAttribute("avgAccuracyRate", avgAccruacyRate / 10);
		request.setAttribute("avgErrorRate", avgErrorRate / 10);
	}
}