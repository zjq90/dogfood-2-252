package com.shop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.entity.Product;
import com.shop.service.ProductService;
import com.shop.util.IPTimeStamp;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * 商品控制器
 * 处理商品管理相关请求，包括后台商品管理和前台商品展示
 * 
 * @author shop
 * @date 2024-03-24
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

    @Value("${file.upload.path}")
    private String uploadPath;

    @Autowired
    private ProductService productService;

    /**
     * 商品列表（后台管理）
     * 查询所有商品并展示在后台管理页面
     * 
     * @param model 数据模型
     * @return 商品列表页面
     */
    @GetMapping("/list")
    public String listProduct(Model model) {
        logger.debug("查询商品列表");
        List<Product> list = productService.listProduct();
        model.addAttribute("list", list);
        return "product/list";
    }

    /**
     * 跳转到添加商品页面
     * 
     * @return 添加商品页面
     */
    @GetMapping("/add")
    public String toAddProduct() {
        return "product/add";
    }

    /**
     * 添加商品
     * 处理商品添加请求，包括图片上传
     * 
     * @param product 商品信息
     * @param file 商品图片文件
     * @return 重定向到商品列表
     * @throws IOException 文件上传异常
     */
    @PostMapping("/add")
    public String addProduct(Product product, @RequestParam("file") MultipartFile file) throws IOException {
        logger.info("添加商品: {}", product.getPname());

        if (!file.isEmpty()) {
            File pathFile = new File(uploadPath);
            if (!pathFile.exists()) {
                pathFile.mkdirs();
            }

            IPTimeStamp ip = new IPTimeStamp();
            String ext = FilenameUtils.getExtension(file.getOriginalFilename());
            String newFileName = ip.getTimeStamp() + "." + ext;

            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(uploadPath, newFileName));
            product.setPic(newFileName);
            logger.debug("上传图片成功: {}", newFileName);
        }

        productService.addProduct(product);
        logger.info("商品添加成功: {}", product.getPname());
        return "redirect:list";
    }

    /**
     * 删除商品
     * 根据商品ID删除商品
     * 
     * @param pid 商品ID
     * @return 重定向到商品列表
     */
    @GetMapping("/delete")
    public String deleteProduct(@RequestParam("pid") Integer pid) {
        logger.info("删除商品: {}", pid);
        productService.deleteProduct(pid);
        return "redirect:list";
    }

    /**
     * 跳转到编辑商品页面
     * 
     * @param pid 商品ID
     * @param model 数据模型
     * @return 编辑商品页面
     */
    @GetMapping("/edit")
    public String toEdit(@RequestParam("pid") Integer pid, Model model) {
        logger.debug("跳转到编辑页面，商品ID: {}", pid);
        Product product = productService.findById(pid);
        model.addAttribute("product", product);
        return "product/edit";
    }

    /**
     * 更新商品信息
     * 处理商品编辑请求，包括图片更新
         * 
     * @param product 商品信息
     * @param file 新的商品图片文件（可选）
     * @return 重定向到商品列表
     * @throws IOException 文件上传异常
     */
    @PostMapping("/update")
    public String updateProduct(Product product, @RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
        logger.info("更新商品: {}", product.getPid());

        Product oldProduct = productService.findById(product.getPid());

        if (file != null && !file.isEmpty() && file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
            File pathFile = new File(uploadPath);
            if (!pathFile.exists()) {
                pathFile.mkdirs();
            }

            // 删除旧图片
            if (oldProduct.getPic() != null && !oldProduct.getPic().isEmpty()) {
                File oldFile = new File(uploadPath + "/" + oldProduct.getPic());
                if (oldFile.exists()) {
                    oldFile.delete();
                }
            }

            IPTimeStamp ip = new IPTimeStamp();
            String ext = FilenameUtils.getExtension(file.getOriginalFilename());
            String newFileName = ip.getTimeStamp() + "." + ext;

            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(uploadPath, newFileName));
            product.setPic(newFileName);
            logger.debug("更新图片成功: {}", newFileName);
        } else {
            product.setPic(oldProduct.getPic());
        }

        productService.updateProduct(product);
        logger.info("商品更新成功: {}", product.getPid());
        return "redirect:list";
    }

    /**
     * 根据名称查询商品
     * 
     * @param pname 商品名称关键字
     * @param model 数据模型
     * @return 商品列表页面
     */
    @PostMapping("/find")
    public String findByPname(@RequestParam("pname") String pname, Model model) {
        logger.debug("根据名称查询商品: {}", pname);
        List<Product> list = productService.findByName(pname);
        model.addAttribute("list", list);
        return "product/list";
    }

    /**
     * 前台商品列表
     * 展示所有商品供前台用户浏览
     * 
     * @param model 数据模型
     * @return 前台商品列表页面
     */
    @GetMapping("/frontlist")
    public String frontList(Model model) {
        logger.debug("查询前台商品列表");
        List<Product> list = productService.listProduct();
        model.addAttribute("list", list);
        return "product/frontlist";
    }

    /**
     * 前台商品分页列表
     * 
     * @param pageNum 页码
     * @param pageSize 每页数量
     * @param session HTTP会话
     * @return 首页
     */
    @GetMapping("/frontpage")
    public String frontPage(@RequestParam(value = "pageNum", required = false) Integer pageNum,
                            @RequestParam(value = "pageSize", required = false) Integer pageSize,
                            HttpSession session) {
        logger.debug("前台商品分页查询，页码: {}, 每页数量: {}", pageNum, pageSize);
        PageHelper.startPage(pageNum == null ? 1 : pageNum, pageSize == null ? 5 : pageSize);
        List<Product> list = productService.listProduct();
        PageInfo<Product> pages = new PageInfo<>(list);
        session.setAttribute("pages", pages);
        return "forward:/";
    }

    /**
     * 前台商品详情
     * 
     * @param pid 商品ID
     * @param model 数据模型
     * @return 商品详情页面
     */
    @GetMapping("/detail")
    public String detail(@RequestParam("pid") Integer pid, Model model) {
        logger.debug("查询商品详情: {}", pid);
        Product product = productService.findById(pid);
        model.addAttribute("product", product);
        return "product/detail";
    }

    /**
     * 搜索商品
     * 根据关键字搜索商品
     * 
     * @param keyword 搜索关键字
     * @param model 数据模型
     * @return 商品列表页面
     */
    @GetMapping("/search")
    public String search(@RequestParam("keyword") String keyword, Model model) {
        logger.debug("搜索商品，关键字: {}", keyword);
        List<Product> list = productService.findByName(keyword);
        model.addAttribute("list", list);
        return "product/frontlist";
    }

    /**
     * 热门商品列表
     * 展示热门商品
     * 
     * @param model 数据模型
     * @return 商品列表页面
     */
    @GetMapping("/hot")
    public String hotProducts(Model model) {
        logger.debug("查询热门商品列表");
        List<Product> list = productService.findHotProducts();
        model.addAttribute("list", list);
        return "product/frontlist";
    }

    /**
     * 最新商品列表
     * 展示最新上架的商品
     * 
     * @param model 数据模型
     * @return 商品列表页面
     */
    @GetMapping("/new")
    public String newProducts(Model model) {
        logger.debug("查询最新商品列表");
        List<Product> list = productService.findNewProducts();
        model.addAttribute("list", list);
        return "product/frontlist";
    }
}
