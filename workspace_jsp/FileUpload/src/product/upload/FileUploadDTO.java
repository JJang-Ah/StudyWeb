package product.upload;

public class FileUploadDTO {

	private String writer;
	private String subject;
	private String uploadFile1;
	private String uploadFile2;
	private String uploadFile3;
	private String uploadFile4;
	private String uploadFile5;

	public String getWriter() {
		return writer;
	}

	public String getSubject() {
		return subject;
	}

	public String getUploadFile1() {
		return uploadFile1;
	}

	public String getUploadFile2() {
		return uploadFile2;
	}

	public String getUploadFile3() {
		return uploadFile3;
	}

	public String getUploadFile4() {
		return uploadFile4;
	}

	public String getUploadFile5() {
		return uploadFile5;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setUploadFile1(String uploadFile1) {
		this.uploadFile1 = uploadFile1;
	}

	public void setUploadFile2(String uploadFile2) {
		this.uploadFile2 = uploadFile2;
	}

	public void setUploadFile3(String uploadFile3) {
		this.uploadFile3 = uploadFile3;
	}

	public void setUploadFile4(String uploadFile4) {
		this.uploadFile4 = uploadFile4;
	}

	public void setUploadFile5(String uploadFile5) {
		this.uploadFile5 = uploadFile5;
	}

	@Override
	public String toString() {
		return "FileUploadDTO [writer=" + writer + ", subject=" + subject + ", uploadFile1=" + uploadFile1
				+ ", uploadFile2=" + uploadFile2 + ", uploadFile3=" + uploadFile3 + ", uploadFile4=" + uploadFile4
				+ ", uploadFile5=" + uploadFile5 + "]";
	}

}
