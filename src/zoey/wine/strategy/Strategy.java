package zoey.wine.strategy;

import javax.servlet.http.HttpServletRequest;

public interface Strategy {
	void algorithm(HttpServletRequest request);
}
