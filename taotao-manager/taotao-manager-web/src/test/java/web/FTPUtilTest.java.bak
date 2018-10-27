package web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

import org.junit.Test;

import com.taotao.common.utils.FtpUtil;

public class FTPUtilTest {
	@Test
	public void testFtpUtils() throws FileNotFoundException {
		FtpUtil.uploadFile("192.168.48.128", 21, "ftpuser", "ftpuser", "/home/ftpuser/www/images", "/2018/04/01",
				"hello.jpg", new FileInputStream(new File("D:\\Documents\\Pictures\\2.jpg")));
	}
}
