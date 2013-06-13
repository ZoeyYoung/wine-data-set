package zoey.wine.bean;

import java.io.Serializable;

@SuppressWarnings("serial")
public class WineBean implements Serializable{
	int classs;
	double alcohol;
 	double malic_acid;
 	double ash;
 	double alcalinity_of_ash;
 	double magnesium;
 	double total_phenols;
 	double flavanoids;
 	double nonflavanoid_phenols;
 	double proanthocyanins;
 	double color_intensity;
 	double hue;
 	double OD280_OD315_of_diluted_wines;
 	double proline;
	public int getClasss() {
		return classs;
	}
	public void setClasss(int classs) {
		this.classs = classs;
	}
	public double getAlcohol() {
		return alcohol;
	}
	public void setAlcohol(double alcohol) {
		this.alcohol = alcohol;
	}
	public double getMalic_acid() {
		return malic_acid;
	}
	public void setMalic_acid(double malic_acid) {
		this.malic_acid = malic_acid;
	}
	public double getAsh() {
		return ash;
	}
	public void setAsh(double ash) {
		this.ash = ash;
	}
	public double getAlcalinity_of_ash() {
		return alcalinity_of_ash;
	}
	public void setAlcalinity_of_ash(double alcalinity_of_ash) {
		this.alcalinity_of_ash = alcalinity_of_ash;
	}
	public double getMagnesium() {
		return magnesium;
	}
	public void setMagnesium(double magnesium) {
		this.magnesium = magnesium;
	}
	public double getTotal_phenols() {
		return total_phenols;
	}
	public void setTotal_phenols(double total_phenols) {
		this.total_phenols = total_phenols;
	}
	public double getFlavanoids() {
		return flavanoids;
	}
	public void setFlavanoids(double flavanoids) {
		this.flavanoids = flavanoids;
	}
	public double getNonflavanoid_phenols() {
		return nonflavanoid_phenols;
	}
	public void setNonflavanoid_phenols(double nonflavanoid_phenols) {
		this.nonflavanoid_phenols = nonflavanoid_phenols;
	}
	public double getProanthocyanins() {
		return proanthocyanins;
	}
	public void setProanthocyanins(double proanthocyanins) {
		this.proanthocyanins = proanthocyanins;
	}
	public double getColor_intensity() {
		return color_intensity;
	}
	public void setColor_intensity(double color_intensity) {
		this.color_intensity = color_intensity;
	}
	public double getHue() {
		return hue;
	}
	public void setHue(double hue) {
		this.hue = hue;
	}
	public double getOD280_OD315_of_diluted_wines() {
		return OD280_OD315_of_diluted_wines;
	}
	public void setOD280_OD315_of_diluted_wines(double oD280_OD315_of_diluted_wines) {
		OD280_OD315_of_diluted_wines = oD280_OD315_of_diluted_wines;
	}
	public double getProline() {
		return proline;
	}
	public void setProline(double proline) {
		this.proline = proline;
	}
}
