package com.model2.mvc.service.product;

import java.util.HashMap;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductService {

	public Product addProduct(Product productVO) throws Exception;
	public Product getProduct(int productNo) throws Exception;
	public Map<String, Object> getProductList(Search search) throws Exception;
	public Product updateProduct(Product productVO) throws Exception;
}
