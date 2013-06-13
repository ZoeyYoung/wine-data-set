package zoey.wine.strategy;

public class ModelAssessment {
	private int wrong = 0;
	private double accuracyRate = 0;
	private double errorRate = 0;
	private long time;

	public int getWrong() {
		return wrong;
	}

	public void setWrong(int wrong) {
		this.wrong = wrong;
	}

	public double getAccuracyRate() {
		return this.accuracyRate;
	}

	public void setAccuracyRate(int wrong, int size) {
		this.accuracyRate = (double) (size - wrong) / (double) size;
	}

	public double getErrorRate() {
		return this.errorRate;
	}

	public void setErrorRate(int wrong, int size) {
		this.errorRate = (double) wrong / (double) size;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long begin, long end) {
		this.time = end - begin;
	}

}
