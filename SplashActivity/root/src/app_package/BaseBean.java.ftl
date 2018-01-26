package  ${packageName}.Bean;

public class BaseBean<T> {

	private T body;
	private String resultMsg;
	private int resultCode;

	public boolean isError() {
		return getResultCode() == 0 ? true : false;
	}

	public T getBody() {
		return body;
	}

	public void setBody(T body) {
		this.body = body;
	}

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

	public int getResultCode() {
		return resultCode;
	}

	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}
}