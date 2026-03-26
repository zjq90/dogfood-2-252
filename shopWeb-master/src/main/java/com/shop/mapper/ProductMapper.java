package com.shop.mapper;

import com.shop.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

/**
 * 商品数据访问层
 * 
 * @author shop
 */
public interface ProductMapper {

    int deleteByPrimaryKey(Integer pid);

    int insert(Product product);

    int insertSelective(Product product);

    Product selectByPrimaryKey(Integer pid);

    int updateByPrimaryKeySelective(Product product);

    int updateByPrimaryKey(Product product);

    List<Product> listProduct();

    List<Product> findByPname(String pname);

    List<Product> frontlistNew();

    List<Product> frontlistHot();

    int subProductNumber(@Param("list") Set<Product> set);

    /**
     * 更新商品库存
     * @param product 商品对象（包含pid和number）
     * @return 影响行数
     */
    int updateStock(Product product);
}
