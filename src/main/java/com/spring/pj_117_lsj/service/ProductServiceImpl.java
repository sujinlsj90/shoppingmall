package com.spring.pj_117_lsj.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.pj_117_lsj.dao.ProductDAOImpl;
import com.spring.pj_117_lsj.dto.ProductDTO;

import page.Paging;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductDAOImpl dao;
	//상품등록
	@Override
	public void productAddAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service => productAddAction");
		//추가S : JSP의 ImageUploadHandler.java파일 기능 
		MultipartFile file = req.getFile("pdImg"); //상품이미지
		System.out.println("file: " + file);
		
		//input경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
		System.out.println("saveDir: " + saveDir);
		
		//추가하기 위해 선택할 이미지
		//"E:\DEV_117\workspace\spring_pj_117_lsj\src\main\webapp\resources\images\product_sample"
		
		//output경로 (jsp의 IMG_UPLOAD_DIR) : spring_pj_117_lsj 수정
		String realDir = "E:\\DEV_117\\workspace\\spring_pj_117_lsj\\src\\main\\webapp\\resources\\upload\\";
		System.out.println("realDir: " + saveDir);
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));
			
			fis = new FileInputStream(saveDir + file.getOriginalFilename());
			fos = new FileOutputStream(realDir + file.getOriginalFilename());
			
			int data = 0;
			
			while((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
			
			//추가 E
			ProductDTO dto = new ProductDTO();
			
			dto.setBrand(req.getParameter("brand"));
			dto.setPdName(req.getParameter("pdName"));
			dto.setWeight(req.getParameter("weight"));
			dto.setCategory(req.getParameter("category"));
			
			//수정S
			String p_img1 = "/pj_117_lsj/resources/upload/" + file.getOriginalFilename();
			System.out.println("dto.getpdImg(): " + p_img1);
			
			//수정E
			
			
			dto.setPdImg(p_img1);
			
			
			dto.setContent(req.getParameter("content"));
			dto.setPrice(Integer.parseInt(req.getParameter("price")));
			dto.setQuantity(Integer.parseInt(req.getParameter("quantity")));
			dto.setStatus(req.getParameter("status"));
			
//			ProductDAO dao = ProductDAOImpl.getInstance();
			
			int insertCnt = dao.productInsert(dto);
			
			System.out.println("insertCnt: " + insertCnt); //정상 : 1
			
			model.addAttribute("dto", dto);
			model.addAttribute("insertCnt", insertCnt);	//정상1
			
		} catch(IOException e) {
			e.printStackTrace();
			
		} finally {
			if(fis != null)fis.close();
	        if(fos != null)fos.close();
		}
		
		
		
		
	}

	//상품목록
	@Override
	public void productList(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("service => productList");
		
		String pageNum = req.getParameter("pageNum");
		
//		ProductDAO dao = ProductDAOImpl.getInstance();
		
		int total = dao.productCnt();
		System.out.println("productCnt: " + total);
		Paging paging = new Paging(pageNum);
		
		paging.setTotalCount(total);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", paging.getStartRow());
		map.put("end", paging.getEndRow());
		
		//목록
		List<ProductDTO> list = dao.productList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		
	}
	
	//상세페이지
	@Override
	public void productDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("service => productDetailAction");
		
		String pageNum = req.getParameter("pageNum");
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		
//		ProductDAO dao = ProductDAOImpl.getInstance();
		
		ProductDTO dto = dao.productDetail(pdNo);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", dto);
	}
	
	// 상품수정
	   @Override
	   public void productUpdateAction(MultipartHttpServletRequest req, Model model)
	         throws ServletException, IOException {
	      
	      System.out.println("서비스 - productDetailAction");
	      
	      // 화면값 받아오기(hidden값)
	      int pageNum = Integer.parseInt(req.getParameter("pageNum"));
	      int hiddenPdNo = Integer.parseInt(req.getParameter("hiddenPdNo")); // pk
	      String hiddenPdImg = req.getParameter("hiddenPdImg");  // 기존 상품이미지
	      System.out.println("hiddenPdImg : " + hiddenPdImg);
	      // String uploadPdImg = (String)req.getAttribute("fileName"); // upload 파일명
	      
	      //////////////////////////////////

	      // 추가S : JSP의 ImageUploadHandler.java 기능
	      // productDetailAction.jsp에서 <input type="file" name="pdImg">이므로
	      MultipartFile file = req.getFile("pdImg");  // 상품이미지
	      System.out.println("file : " + file);
	      
	      // input 경로
	      String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
	      System.out.println("saveDir : " + saveDir);
	      
	      // 추가하기 위해 선택할 샘플이미지 경로
	      // D:\Dev117\workspace\spring_pj_117_lsj\src\main\webapp\resources\images\product_sample
	      
	      // output 경로(jsp의 IMG_UPLOAD_DIR) : spring_pj_117_lsj 수정
	      String realDir = "E:\\DEV_117\\workspace\\spring_pj_117_lsj\\src\\main\\webapp\\resources\\upload\\";
	      System.out.println("realDir : " + realDir);
	      
	      String p_img1 = "";
	      FileInputStream fis = null;
	      FileOutputStream fos = null;
	      
	      // 이미지를 수정하고자 할 경우 선택한 이미지를 p_img에 등록
	      if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
	         try {
	            file.transferTo(new File(saveDir + file.getOriginalFilename()));
	            
	            fis = new FileInputStream(saveDir + file.getOriginalFilename());
	            fos = new FileOutputStream(realDir + file.getOriginalFilename());
	            
	            int data = 0;
	            
	            while((data = fis.read()) != -1) {
	               fos.write(data);
	            }
	         } catch(IOException e) {
	            e.printStackTrace();
	         } finally {
	            if(fis != null) fis.close();
	            if(fos != null) fos.close();
	         }
	         
	         // 수정S
	         p_img1 = "/pj_117_lsj/resources/upload/" + file.getOriginalFilename(); // 컨텍스트명/경로
	         System.out.println("새 이미지 : " + p_img1);
	         // 수정E
	      } else {
	         // 기존 이미지 사용(이미지 수정 안할 경우)
	         p_img1 = hiddenPdImg;
	         System.out.println("기존 이미지 : " + p_img1);
	      }
	      
	      // 추가E
	      //////////////////////////////////
	      
	      // 3단계. 화면으로부터 입력받은 값을 받는다.
	      ProductDTO dto = new ProductDTO();
	      // 실제 화면값 받아오기
	      dto.setPdNo(hiddenPdNo);  // 누락주의
	      dto.setPdName(req.getParameter("pdName"));
	      dto.setBrand(req.getParameter("brand"));
	      dto.setPdImg(p_img1);  // 이미지 추가 주의
	      dto.setCategory(req.getParameter("category"));
	      dto.setContent(req.getParameter("content"));
	      dto.setPrice(Integer.parseInt(req.getParameter("price")));
	      dto.setQuantity(Integer.parseInt(req.getParameter("quantity")));
	      dto.setStatus(req.getParameter("status"));
	      dto.setWeight(req.getParameter("weight"));
	      
	      // 4단계. 싱글톤으로 dao 객체 생성, 다형성 생성
	      // ProductDAO dao = ProductDAOImpl.getInstance();
	      
	      // 5단계. 상품정보 수정하기
	      int updateCnt = dao.productUpdate(dto);
	      
	      // 6단계. jsp로 처리결과 전달
	      model.addAttribute("pageNum", pageNum);
	      model.addAttribute("updateCnt", updateCnt);
	   }
	
	//상품삭제
	@Override
	public void productDeleteAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("service => productDeleteAction");
		
		int pdNo = Integer.parseInt(req.getParameter("pdNo"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		int deleteCnt = dao.productDelete(pdNo);
		
		model.addAttribute("pdNo", pdNo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("deleteCnt", deleteCnt);

	}
}
