package zoey.wine.strategy;

import javax.servlet.http.*;

public class Context {
	Strategy strategy;
	HttpServletRequest request;

	public Context(Strategy strategy, HttpServletRequest request) {
		this.strategy = strategy;
		this.request = request;
	}

	public void ContextInterface() {
		strategy.algorithm(request);
	}
}
