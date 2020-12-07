/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : bjsxt-his

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 19/06/2020 11:14:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for his_care_history
-- ----------------------------
DROP TABLE IF EXISTS `his_care_history`;
CREATE TABLE `his_care_history`  (
  `ch_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '病历ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '医生id',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `patient_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者id',
  `patient_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '科室id',
  `dept_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `receive_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接诊类型：0初诊，1复诊  字典表属性his_receive_type',
  `is_contagious` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否传染，0否，1是 字典表属性his_contagious_status',
  `care_time` datetime(0) NULL DEFAULT NULL COMMENT '就诊时间',
  `case_date` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发病日期',
  `reg_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号单号',
  `case_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主诉',
  `case_result` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断信息',
  `doctor_tips` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医生建议',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '病例表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_care_order
-- ----------------------------
DROP TABLE IF EXISTS `his_care_order`;
CREATE TABLE `his_care_order`  (
  `co_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '处方ID',
  `co_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方类型0药用处方1检查处方',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '医生id',
  `patient_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者id',
  `patient_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `ch_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联病历id',
  `all_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '处方全额',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`co_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '药用处方表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_care_order_item
-- ----------------------------
DROP TABLE IF EXISTS `his_care_order_item`;
CREATE TABLE `his_care_order_item`  (
  `item_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开诊明细ID',
  `co_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属处方id',
  `item_ref_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品或者检查项目id',
  `item_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品或检查项目名称',
  `item_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目类型0药品  还是1检查项',
  `num` decimal(10, 2) NULL DEFAULT NULL COMMENT '数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态，0未支付，1已支付，2，已退费  3，已完成 字典表his_order_details_status',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '开诊细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_check_result
-- ----------------------------
DROP TABLE IF EXISTS `his_check_result`;
CREATE TABLE `his_check_result`  (
  `coc_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '处方检查项ID',
  `check_item_id` int(11) NULL DEFAULT NULL COMMENT '检查项目ID',
  `check_item_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `result_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查结果描述',
  `result_img` json NULL COMMENT '检查结果扫描附件[json表示]',
  `patient_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `patient_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `result_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否录入检查结果0 检测中  1 检测完成  字典表 his_check_result_status',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`coc_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_order_backfee
-- ----------------------------
DROP TABLE IF EXISTS `his_order_backfee`;
CREATE TABLE `his_order_backfee`  (
  `back_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '退费ID',
  `back_amount` decimal(20, 0) NULL DEFAULT NULL COMMENT '总费用',
  `ch_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病历ID',
  `reg_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号单',
  `patient_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者名称',
  `back_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态0未退费  1 退费成功 2退费失败  字典表his_backfee_status',
  `back_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退费类型0现金1支付宝  字典表his_pay_type_status',
  `order_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单ID his_order_charge  ',
  `back_platform_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退费交易ID',
  `back_time` datetime(0) NULL DEFAULT NULL COMMENT '退费交易时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`back_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '退费主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_order_backfee_item
-- ----------------------------
DROP TABLE IF EXISTS `his_order_backfee_item`;
CREATE TABLE `his_order_backfee_item`  (
  `item_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详情ID和his_care_order_*表里面的ID一样',
  `co_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方ID【备用】',
  `item_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `item_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '项目价格',
  `item_num` int(11) NULL DEFAULT NULL COMMENT '项目数量',
  `item_amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '小计',
  `back_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单ID his_oder_backfee主键',
  `item_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目类型0药品  还是1检查项',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态，0未支付，1已支付，2，已退费  3，已完成   字典表 his_order_details_status',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '退费订单详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_order_charge
-- ----------------------------
DROP TABLE IF EXISTS `his_order_charge`;
CREATE TABLE `his_order_charge`  (
  `order_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收费ID',
  `order_amount` decimal(20, 0) NULL DEFAULT NULL COMMENT '总费用',
  `ch_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病历ID',
  `reg_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号单',
  `patient_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者名称',
  `order_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态0未支付  1 支付成功  2支付超时 3支付失败 字典表his_order_charge_status',
  `pay_platform_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付ID',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `pay_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付类型0现金1支付宝  字典表	his_pay_type_status',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收费表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_order_charge_item
-- ----------------------------
DROP TABLE IF EXISTS `his_order_charge_item`;
CREATE TABLE `his_order_charge_item`  (
  `item_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详情ID和his_care_order_*表里面的ID一样',
  `co_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方ID【备用】',
  `item_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `item_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '项目价格',
  `item_num` int(11) NULL DEFAULT NULL COMMENT '项目数量',
  `item_amount` decimal(10, 0) NULL DEFAULT NULL COMMENT '小计',
  `order_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单IDhis_oder_charge主键',
  `item_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目类型0药品  还是1检查项',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态，0未支付，1已支付，2，已退费  3，已完成 字典表 his_order_details_status',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付订单详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_patient
-- ----------------------------
DROP TABLE IF EXISTS `his_patient`;
CREATE TABLE `his_patient`  (
  `patient_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者电话',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '2' COMMENT '患者性别0男1女 2未知字典表 sys_user_sex',
  `birthday` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出生年月',
  `id_card` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '身份证号[认证ID]',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址信息',
  `allergy_info` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过敏信息',
  `is_final` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否完善信息，0未完善1已完善 字典表 his_patient_msg_final',
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `last_login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '患者信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_patient
-- ----------------------------
INSERT INTO `his_patient` VALUES ('HZ1263653571396763648', '唐太宗', '13421331131', '0', '1980-01-01', '42108719900103451X', '湖北武汉', '青霉素过敏', '0', '7a96e6f9ea9b71ff31a33cbcc8aa05cc', NULL, NULL, NULL, '2020-05-22 02:11:04', '2020-05-26 03:56:59');
INSERT INTO `his_patient` VALUES ('HZ1263654020086628352', '唐高宗', '13451311334', '0', '1960-01-01', '431123198011301341', '湖北武汉', '青霉素过敏', '0', 'df8f0335f6e3fa839609e1a8077fd093', NULL, NULL, NULL, '2020-05-22 02:12:51', '2020-05-26 04:22:52');
INSERT INTO `his_patient` VALUES ('HZ1268724157491838976', '张三', '13456789021', '0', '2020-06-08', '431113311133314531', '武汉', NULL, '0', '948219b558a8270876b31eb46cde08d7', NULL, NULL, NULL, '2020-06-05 01:59:46', '2020-06-05 09:59:45');
INSERT INTO `his_patient` VALUES ('HZ1271368119784439808', '孙七', '13876787656', '2', '1990-01-01', '431333113331113311', '武汉', NULL, '0', 'a2aa685cd9d1c0e422a1eb8ba72d2096', NULL, NULL, NULL, '2020-06-12 09:05:55', '2020-06-12 17:05:55');

-- ----------------------------
-- Table structure for his_patient_file
-- ----------------------------
DROP TABLE IF EXISTS `his_patient_file`;
CREATE TABLE `his_patient_file`  (
  `patient_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者id',
  `emergency_contact_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `emergency_contact_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话',
  `emergency_contact_relation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '爸爸,妈妈,儿子,女儿,亲戚,朋友',
  `left_ear_hearing` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '左耳听力 正常  耳聋',
  `right_ear_hearing` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '右耳听力 正常  耳聋',
  `left_vision` decimal(10, 1) NULL DEFAULT NULL COMMENT '左眼视力',
  `right_vision` decimal(10, 1) NULL DEFAULT NULL COMMENT '右眼视力',
  `height` decimal(10, 2) NULL DEFAULT NULL COMMENT '身高',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '体重',
  `blood_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '血型 A  B  AB  O    R-阴 RH-阳',
  `personal_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人史',
  `family_info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家族史',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_patient_file
-- ----------------------------
INSERT INTO `his_patient_file` VALUES ('HZ1262957125722832896', '张大明', '15900131131', '爸爸', '1.1', '1.1', 5.0, 5.0, 1.75, 60.00, 'A', '无', '父亲心脏病', '2020-05-14 16:35:18', '2020-05-21 17:52:50');

-- ----------------------------
-- Table structure for his_registration
-- ----------------------------
DROP TABLE IF EXISTS `his_registration`;
CREATE TABLE `his_registration`  (
  `registration_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '挂号流水',
  `patient_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `patient_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '接诊医生ID',
  `doctor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接诊医生姓名',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '科室ID',
  `registration_item_id` bigint(20) NULL DEFAULT NULL COMMENT '挂号费用ID',
  `registration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '挂号总金额',
  `registration_number` int(11) NULL DEFAULT NULL COMMENT '挂号编号',
  `registration_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号状态0未收费,1待就诊，2,就诊中，3，就诊完成，4，已退号，5 作废',
  `visit_date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊日期',
  `scheduling_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排班类型1 门诊 2 急诊 字典表数据翻译',
  `subsection_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '排班时段1上午  2下午 3晚上 字典表数据翻译',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`registration_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_scheduling
-- ----------------------------
DROP TABLE IF EXISTS `his_scheduling`;
CREATE TABLE `his_scheduling`  (
  `user_id` int(10) NOT NULL COMMENT '医生ID',
  `dept_id` int(10) NOT NULL COMMENT '科室ID',
  `scheduling_day` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值班日期',
  `subsection_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '排班时段1上午  2下午 3晚上 字典表数据翻译',
  `scheduling_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排班类型1 门诊 2 急诊 字典表数据翻译',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '排班信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stock_inventory_log
-- ----------------------------
DROP TABLE IF EXISTS `stock_inventory_log`;
CREATE TABLE `stock_inventory_log`  (
  `inventory_log_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '入库ID',
  `purchase_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '采购单据ID',
  `medicines_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '药品ID',
  `inventory_log_num` int(10) NULL DEFAULT NULL COMMENT '入库数量',
  `trade_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '批发价',
  `prescription_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '处方价',
  `trade_total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '批发额',
  `prescription_total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '处方额',
  `batch_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '药品生产批次号',
  `medicines_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品名称',
  `medicines_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品分类 sys_dict_data表his_medicines_type',
  `prescription_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '处方类型 sys_dict_data表his_prescription_type',
  `producter_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '生产厂家ID',
  `conversion` int(10) NULL DEFAULT 1 COMMENT '换算量',
  `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '单位（g/条）',
  `provider_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`inventory_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_inventory_log
-- ----------------------------
INSERT INTO `stock_inventory_log` VALUES ('1263759287176527872', 'CG1263758807713054720', '1', 20, 2.00, 5.00, 40.00, 100.00, 'P1', '阿胶珠', '1', '1', '1', 1, 'g', '101', '2020-05-22 09:12:01', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759287189110784', 'CG1263758807713054720', '2', 20, 2.00, 5.00, 40.00, 100.00, 'P1', '醋艾炭', '1', '1', '2', 1, 'g', '101', '2020-05-22 09:12:01', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759287197499392', 'CG1263758807713054720', '3', 20, 2.00, 5.00, 40.00, 100.00, 'P1', '制巴戟天', '1', '1', '1', 1, 'g', '101', '2020-05-22 09:12:01', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759287214276608', 'CG1263758807713054720', '4', 20, 2.00, 5.00, 40.00, 100.00, 'P1', '白蔹', '1', '1', '1', 1, 'g', '101', '2020-05-22 09:12:01', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759287226859520', 'CG1263758807713054720', '5', 20, 2.00, 5.00, 40.00, 100.00, 'P1', '白果', '1', '1', '1', 1, 'g', '101', '2020-05-22 09:12:01', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759287235248128', 'CG1263758807713054720', '6', 20, 2.00, 5.00, 40.00, 100.00, 'P1', '白芨', '1', '1', '1', 1, 'g', '101', '2020-05-22 09:12:01', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759287243636736', 'CG1263758807713054720', '7', 20, 2.00, 5.00, 40.00, 100.00, 'P1', '白芍', '1', '1', '1', 1, 'g', '101', '2020-05-22 09:12:01', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759287256219648', 'CG1263758807713054720', '8', 20, 2.00, 5.00, 40.00, 100.00, 'P1', '白英', '1', '1', '1', 1, 'g', '101', '2020-05-22 09:12:01', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759287264608256', 'CG1263758807713054720', '9', 20, 2.00, 5.00, 40.00, 100.00, 'P1', '白芷', '1', '1', '1', 1, 'g', '101', '2020-05-22 09:12:01', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759287272996864', 'CG1263758807713054720', '10', 20, 2.00, 5.00, 40.00, 100.00, 'P1', '炒牵牛子', '1', '1', '1', 1, 'g', '101', '2020-05-22 09:12:01', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759752924626944', 'CG1263759614625841152', '1', 40, 2.00, 6.00, 80.00, 240.00, 'P2', '阿胶珠', '1', '1', '1', 1, 'g', '102', '2020-05-22 09:13:29', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759752937209856', 'CG1263759614625841152', '2', 40, 2.00, 6.00, 80.00, 240.00, 'P2', '醋艾炭', '1', '1', '2', 1, 'g', '102', '2020-05-22 09:13:29', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759752945598464', 'CG1263759614625841152', '3', 40, 2.00, 6.00, 80.00, 240.00, 'P2', '制巴戟天', '1', '1', '1', 1, 'g', '102', '2020-05-22 09:13:29', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759752953987072', 'CG1263759614625841152', '4', 40, 2.00, 6.00, 80.00, 240.00, 'P2', '白蔹', '1', '1', '1', 1, 'g', '102', '2020-05-22 09:13:29', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759752970764288', 'CG1263759614625841152', '5', 40, 2.00, 6.00, 80.00, 240.00, 'P2', '白果', '1', '1', '1', 1, 'g', '102', '2020-05-22 09:13:29', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759752979152896', 'CG1263759614625841152', '6', 40, 2.00, 6.00, 80.00, 240.00, 'P2', '白芨', '1', '1', '1', 1, 'g', '102', '2020-05-22 09:13:29', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759752991735808', 'CG1263759614625841152', '7', 40, 2.00, 6.00, 80.00, 240.00, 'P2', '白芍', '1', '1', '1', 1, 'g', '102', '2020-05-22 09:13:29', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759753000124416', 'CG1263759614625841152', '8', 40, 2.00, 6.00, 80.00, 240.00, 'P2', '白英', '1', '1', '1', 1, 'g', '102', '2020-05-22 09:13:29', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759753008513024', 'CG1263759614625841152', '9', 40, 2.00, 6.00, 80.00, 240.00, 'P2', '白芷', '1', '1', '1', 1, 'g', '102', '2020-05-22 09:13:29', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1263759753016901632', 'CG1263759614625841152', '10', 40, 2.00, 6.00, 80.00, 240.00, 'P2', '炒牵牛子', '1', '1', '1', 1, 'g', '102', '2020-05-22 09:13:29', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1264762105261850624', 'CG1264752330314743808', '1', 20, 2.00, NULL, 40.00, NULL, '1', '阿胶珠', '1', '1', '1', 1, 'g', '102', '2020-05-25 03:37:36', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1264762105278627840', 'CG1264752330314743808', '2', 20, 2.00, NULL, 40.00, NULL, '2', '醋艾炭', '1', '1', '2', 1, 'g', '102', '2020-05-25 03:37:36', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1271356423200178176', 'CG1271356147747651584', '2', 10, 20.00, NULL, 200.00, NULL, '21', '醋艾炭', '1', '1', '2', 1, 'g', '102', '2020-06-12 08:19:53', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1271358744239931392', 'CG1271358119477379072', '1', 100, 10.00, NULL, 1000.00, NULL, '1', '阿胶珠', '1', '1', '1', 1, 'g', '101', '2020-06-12 08:29:09', '扁鹊');
INSERT INTO `stock_inventory_log` VALUES ('1271358744252514304', 'CG1271358119477379072', '2', 100, 10.00, NULL, 1000.00, NULL, '2', '醋艾炭', '1', '1', '2', 1, 'g', '101', '2020-06-12 08:29:09', '扁鹊');

-- ----------------------------
-- Table structure for stock_medicines
-- ----------------------------
DROP TABLE IF EXISTS `stock_medicines`;
CREATE TABLE `stock_medicines`  (
  `medicines_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `medicines_number` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品编号',
  `medicines_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品名称',
  `medicines_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品分类 sys_dict_data表his_medicines_type',
  `prescription_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '处方类型 sys_dict_data表his_prescription_type',
  `prescription_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '处方价格',
  `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '单位（g/条）',
  `conversion` int(10) NULL DEFAULT 1 COMMENT '换算量',
  `keywords` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键字',
  `producter_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '生产厂家ID',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品状态0正常0停用 sys_dict_data表 sys_normal_disable',
  `medicines_stock_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '库存量',
  `medicines_stock_danger_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '预警值',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除状态0正常0删除 要有重新导入功能',
  PRIMARY KEY (`medicines_id`) USING BTREE,
  INDEX `medicines_number`(`medicines_number`) USING BTREE,
  INDEX `medicines_name`(`medicines_name`) USING BTREE,
  INDEX `index_keywords`(`keywords`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 531 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_medicines
-- ----------------------------
INSERT INTO `stock_medicines` VALUES (1, 'sxt0001', '阿胶珠', '1', '1', 2.00, 'g', 1, 'ajz', '1', '0', 200, 100, '2020-05-04 17:22:51', '2020-06-12 08:29:09', '超级管理员', '扁鹊', '0');
INSERT INTO `stock_medicines` VALUES (2, 'sxt0002', '醋艾炭', '1', '1', 2.00, 'g', 1, 'cat', '2', '0', 210, 100, '2020-05-04 17:22:51', '2020-06-12 08:29:09', '超级管理员', '扁鹊', '0');
INSERT INTO `stock_medicines` VALUES (3, 'sxt0003', '制巴戟天', '1', '1', 2.00, 'g', 1, 'zbjt', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (4, 'sxt0004', '白蔹', '1', '1', 2.00, 'g', 1, 'bl', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (5, 'sxt0005', '白果', '1', '1', 2.00, 'g', 1, 'bg', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (6, 'sxt0006', '白芨', '1', '1', 2.00, 'g', 1, 'bj', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (7, 'sxt0007', '白芍', '1', '1', 2.00, 'g', 1, 'bs', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (8, 'sxt0008', '白英', '1', '1', 2.00, 'g', 1, 'by', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (9, 'sxt0009', '白芷', '1', '1', 2.00, 'g', 1, 'bz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (10, 'sxt0010', '炒牵牛子', '1', '1', 2.00, 'g', 1, 'cqnz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (11, 'sxt0011', '白豆蔻', '1', '1', 2.00, 'g', 1, 'bdk', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (12, 'sxt0012', '制白附子', '1', '1', 2.00, 'g', 1, 'zbfz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (13, 'sxt0013', '金钱白花蛇', '1', '1', 2.00, '条', 1, 'jqbhs', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (14, 'sxt0014', '白花蛇舌草', '1', '1', 2.00, 'g', 1, 'bhssc', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (15, 'sxt0015', '半枝莲', '1', '1', 2.00, 'g', 1, 'bzl', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (16, 'sxt0016', '盐蒺藜', '1', '1', 2.00, 'g', 1, 'yjl', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (17, 'sxt0017', '白梅花', '1', '1', 2.00, 'g', 1, 'bmh', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (18, 'sxt0018', '白前', '1', '1', 2.00, 'g', 1, 'bq', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (19, 'sxt0019', '白头翁', '1', '1', 2.00, 'g', 1, 'btw', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (20, 'sxt0020', '白薇', '1', '1', 2.00, 'g', 1, 'bw', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (21, 'sxt0021', '白鲜皮', '1', '1', 2.00, 'g', 1, 'bxp', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (22, 'sxt0022', '百合', '1', '1', 2.00, 'g', 1, 'bh', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (23, 'sxt0023', '柏子仁', '1', '1', 2.00, 'g', 1, 'bzr', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (24, 'sxt0024', '北败酱草', '1', '1', 2.00, 'g', 1, 'bbjc', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (25, 'sxt0025', '板蓝根', '1', '1', 2.00, 'g', 1, 'blg', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (26, 'sxt0026', '北沙参', '1', '1', 2.00, 'g', 1, 'bss', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (27, 'sxt0027', '荜茇', '1', '1', 2.00, 'g', 1, 'bb', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (28, 'sxt0028', '绵萆薢', '1', '1', 2.00, 'g', 1, 'mbx', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (29, 'sxt0029', '萹蓄', '1', '1', 2.00, 'g', 1, 'bx', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (30, 'sxt0030', '醋鳖甲', '1', '1', 2.00, 'g', 1, 'cbj', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (31, 'sxt0031', '薄荷', '1', '1', 2.00, 'g', 1, 'bh', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (32, 'sxt0032', '伏龙肝', '1', '1', 2.00, 'g', 1, 'flg', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (33, 'sxt0033', '茯苓', '1', '1', 2.00, 'g', 1, 'fl', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (34, 'sxt0034', '茯苓皮', '1', '1', 2.00, 'g', 1, 'flp', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (35, 'sxt0035', '茯神', '1', '1', 2.00, 'g', 1, 'fs', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (36, 'sxt0036', '浮萍', '1', '1', 2.00, 'g', 1, 'fp', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (37, 'sxt0037', '浮小麦', '1', '1', 2.00, 'g', 1, 'fxm', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (38, 'sxt0038', '覆盆子', '1', '1', 2.00, 'g', 1, 'fpz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (39, 'sxt0039', '木通', '1', '1', 2.00, 'g', 1, 'mt', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (40, 'sxt0040', '山慈菇', '1', '1', 2.00, 'g', 1, 'scg', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (41, 'sxt0041', '广藿香', '1', '1', 2.00, 'g', 1, 'ghx', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (42, 'sxt0042', '干姜', '1', '1', 2.00, 'g', 1, 'gj', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (43, 'sxt0043', '甘草', '1', '1', 2.00, 'g', 1, 'gc', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (44, 'sxt0044', '甘松', '1', '1', 2.00, 'g', 1, 'gs', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (45, 'sxt0045', '高良姜', '1', '1', 2.00, 'g', 1, 'glj', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (46, 'sxt0046', '藁本', '1', '1', 2.00, 'g', 1, 'gb', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (47, 'sxt0047', '葛根', '1', '1', 2.00, 'g', 1, 'gg', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (48, 'sxt0048', '钩藤', '1', '1', 2.00, 'g', 1, 'gt', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (49, 'sxt0049', '烫狗脊', '1', '1', 2.00, 'g', 1, 'tgj', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (50, 'sxt0050', '枸杞子', '1', '1', 2.00, 'g', 1, 'gqz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (51, 'sxt0051', '烫骨碎补', '1', '1', 2.00, 'g', 1, 'tgsb', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (52, 'sxt0052', '瓜蒌皮', '1', '1', 2.00, 'g', 1, 'gjp', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (53, 'sxt0053', '蜜瓜蒌子', '1', '1', 2.00, 'g', 1, 'mgjz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (54, 'sxt0054', '海风藤', '1', '1', 2.00, 'g', 1, 'hft', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (55, 'sxt0055', '海金沙', '1', '1', 2.00, 'g', 1, 'hjs', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (56, 'sxt0056', '海螵蛸', '1', '1', 2.00, 'g', 1, 'hps', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (57, 'sxt0057', '海藻', '1', '1', 2.00, 'g', 1, 'hz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (58, 'sxt0058', '柯子肉', '1', '1', 2.00, 'g', 1, 'kzr', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (59, 'sxt0059', '合欢花', '1', '1', 2.00, 'g', 1, 'hhh', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (60, 'sxt0060', '南沙参', '1', '1', 2.00, 'g', 1, 'nss', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (61, 'sxt0061', '酒女贞子', '1', '1', 2.00, 'g', 1, 'jnzz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (62, 'sxt0062', '藕节', '1', '1', 2.00, 'g', 1, 'oj', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (63, 'sxt0063', '藕节炭', '1', '1', 2.00, 'g', 1, 'ojt', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (64, 'sxt0064', '胖大海', '1', '1', 2.00, 'g', 1, 'pdh', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (65, 'sxt0065', '炮姜', '1', '1', 2.00, 'g', 1, 'pj', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (66, 'sxt0066', '佩兰', '1', '1', 2.00, 'g', 1, 'pl', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (67, 'sxt0067', '炙枇杷叶', '1', '1', 2.00, 'g', 1, 'zbby', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (68, 'sxt0068', '蒲公英', '1', '1', 2.00, 'g', 1, 'pgy', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (69, 'sxt0069', '盐补骨脂', '1', '1', 2.00, 'g', 1, 'ybgz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (70, 'sxt0070', '白矾', '1', '1', 2.00, 'g', 1, 'bf', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (71, 'sxt0071', '炒半夏曲', '1', '1', 2.00, 'g', 1, 'cbxq', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (72, 'sxt0072', '炒芡实', '1', '1', 2.00, 'g', 1, 'cqs', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (73, 'sxt0073', '麸炒山药', '1', '1', 2.00, 'g', 1, 'fcsy', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (74, 'sxt0074', '炒山楂', '1', '1', 2.00, 'g', 1, 'csc', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (75, 'sxt0075', '生神曲', '1', '1', 2.00, 'g', 1, 'ssq', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (76, 'sxt0076', '炒紫苏子', '1', '1', 2.00, 'g', 1, 'czsz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (77, 'sxt0077', '麸炒薏苡仁', '1', '1', 2.00, 'g', 1, 'fcyyr', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (78, 'sxt0078', '炒栀子', '1', '1', 2.00, 'g', 1, 'czz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (79, 'sxt0079', '麸炒枳壳', '1', '1', 2.00, 'g', 1, 'fczk', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (80, 'sxt0080', '车前草', '1', '1', 2.00, 'g', 1, 'cqc', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (81, 'sxt0081', '车前子', '1', '1', 2.00, 'g', 1, 'cqz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (82, 'sxt0082', '陈皮', '1', '1', 2.00, 'g', 1, 'cp', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (83, 'sxt0083', '陈皮炭', '1', '1', 2.00, 'g', 1, 'cpt', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (84, 'sxt0084', '赤芍', '1', '1', 2.00, 'g', 1, 'cs', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (85, 'sxt0085', '赤小豆', '1', '1', 2.00, 'g', 1, 'cxd', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (86, 'sxt0086', '炒稻芽', '1', '1', 2.00, 'g', 1, 'cdy', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (87, 'sxt0087', '炒谷芽', '1', '1', 2.00, 'g', 1, 'cgy', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (88, 'sxt0088', '炒槐花', '1', '1', 2.00, 'g', 1, 'chh', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (89, 'sxt0089', '炒芥子', '1', '1', 2.00, 'g', 1, 'cjz', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (90, 'sxt0090', '炒苦杏仁', '1', '1', 2.00, 'g', 1, 'ckxr', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (91, 'sxt0091', '炒麦芽', '1', '1', 2.00, 'g', 1, 'cmy', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (92, 'sxt0092', '蚕砂', '1', '1', 2.00, 'g', 1, 'cs', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (93, 'sxt0093', '炒苍耳子', '1', '1', 2.00, 'g', 1, 'ccez', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (94, 'sxt0094', '草豆蔻', '1', '1', 2.00, 'g', 1, 'cdk', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-06-12 16:24:41', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (95, 'sxt0095', '炒草果仁', '1', '1', 2.00, 'g', 1, 'ccgr', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '1');
INSERT INTO `stock_medicines` VALUES (96, 'sxt0096', '侧柏炭', '1', '1', 2.00, 'g', 1, 'cbt', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '1');
INSERT INTO `stock_medicines` VALUES (97, 'sxt0097', '柴胡', '1', '1', 2.00, 'g', 1, 'ch', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '1');
INSERT INTO `stock_medicines` VALUES (98, 'sxt0098', '蝉蜕', '1', '1', 2.00, 'g', 1, 'ct', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '1');
INSERT INTO `stock_medicines` VALUES (99, 'sxt0099', '川贝母', '1', '1', 2.00, 'g', 1, 'cbm', '1', '0', 100, 100, '2020-05-04 17:22:51', '2020-05-25 14:22:38', '超级管理员', '', '0');
INSERT INTO `stock_medicines` VALUES (530, '221', '221', '3', '2', 2.00, '221', 221, '221', '2', '0', 100, 100, '2020-05-04 16:49:53', '2020-05-25 14:22:38', '超级管理员', '超级管理员', '1');

-- ----------------------------
-- Table structure for stock_producter
-- ----------------------------
DROP TABLE IF EXISTS `stock_producter`;
CREATE TABLE `stock_producter`  (
  `producter_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '厂家ID',
  `producter_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '厂家名称',
  `producter_code` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '厂家简码 搜索用',
  `producter_address` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '厂家地址 ',
  `producter_tel` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '厂家电话',
  `producter_person` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人',
  `keywords` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键字',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态标志（0正常 1停用）sys_normal_disable',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`producter_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '生产厂家表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_producter
-- ----------------------------
INSERT INTO `stock_producter` VALUES (1, '云南白药集团股份有限公司', '000538', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:21:09', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (2, '上海医药（集团）有限公司', '1812538', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:14:12', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (3, '中国医药集团总公司', '1238571', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:14:22', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (4, '广州医药集团有限公司 ', '1031377', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:14:34', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (5, '哈药集团有限公司', '727719', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:15:45', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (6, '华北制药集团有限责任公司', '700869', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:17:23', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (7, '太极集团有限公司', '589700', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:17:42', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (8, '北京同仁堂集团有限责任公司', '224882', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:18:02', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (9, '湖南九芝堂股份有限公司', '101857', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:18:16', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (10, '新疆新特药民族药业有限责任公司', '85191', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:18:24', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (11, '江苏江山制药有限公司', '72669', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:18:33', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (12, '武汉新琪安药业有限责任公司', '71581', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:18:48', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (13, '武汉中联药业集团股份有限公司', '58164', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:18:59', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (14, '江苏正大天晴药业股份有限公司', '47643', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:19:31', '超级管理员', '');
INSERT INTO `stock_producter` VALUES (15, '贵州三力制药股份有限公司', '603439', '云南省昆明市呈贡区云南白药街3686号', '0871—66350538', '雷大哥', 'ynby', '0', '2020-05-04 17:29:54', '2020-05-04 20:19:56', '超级管理员', '');

-- ----------------------------
-- Table structure for stock_provider
-- ----------------------------
DROP TABLE IF EXISTS `stock_provider`;
CREATE TABLE `stock_provider`  (
  `provider_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `provider_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '供应商名称',
  `contact_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人名称',
  `contact_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人手机',
  `contact_tel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `bank_account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '银行账号',
  `provider_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）sys_normal_disable',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0正常 1删除）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`provider_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '供应商信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_provider
-- ----------------------------
INSERT INTO `stock_provider` VALUES (101, '云南英广贸易有限公司', '雷华', '15902738715', '027-8989765', '6379865245129741669', '云南', '0', '0', '2018-03-16 11:33:00', '2020-05-06 02:23:03', 'admin', 'admin');
INSERT INTO `stock_provider` VALUES (102, '武汉英广贸易有限公司', '雷华', '15902738715', '027-8989765', '6379865245129741669', '武汉', '0', '0', '2018-03-16 11:33:00', '2020-05-06 02:23:05', 'admin', 'admin');
INSERT INTO `stock_provider` VALUES (103, '北京英广贸易有限公司', '雷华', '15902738715', '027-8989765', '6379865245129741669', '北京', '0', '0', '2018-03-16 11:33:00', '2020-05-06 02:23:07', 'admin', 'admin');
INSERT INTO `stock_provider` VALUES (104, '深圳英广贸易有限公司', '雷华', '15902738715', '027-8989765', '6379865245129741669', '深圳', '0', '0', '2018-03-16 11:33:00', '2020-05-06 02:23:08', 'admin', 'admin');

-- ----------------------------
-- Table structure for stock_purchase
-- ----------------------------
DROP TABLE IF EXISTS `stock_purchase`;
CREATE TABLE `stock_purchase`  (
  `purchase_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '制单号ID 全局ID雪花算法',
  `provider_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '供应商ID',
  `purchase_trade_total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '采购批发总额',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单据状态； 1未提交2待审核 3审核通过 4审核失败 5作废 6入库成功 字典表 his_order_status',
  `apply_user_id` bigint(20) NULL DEFAULT NULL COMMENT '申请人ID',
  `apply_user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申请人名称',
  `storage_opt_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入库操作人',
  `storage_opt_time` datetime(0) NULL DEFAULT NULL COMMENT '入库操作时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `examine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核信息',
  PRIMARY KEY (`purchase_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_purchase
-- ----------------------------
INSERT INTO `stock_purchase` VALUES ('CG1264752330314743808', '102', 80.00, '6', 2, '扁鹊', '扁鹊', '2020-05-25 03:37:36', '2020-05-25 03:35:59', '2020-05-25 11:37:16', '扁鹊', '', NULL);
INSERT INTO `stock_purchase` VALUES ('CG1271356147747651584', '102', 200.00, '6', 2, '扁鹊', '扁鹊', '2020-06-12 08:19:53', '2020-06-12 08:19:27', '2020-06-12 16:19:38', '扁鹊', '', '1111');
INSERT INTO `stock_purchase` VALUES ('CG1271358119477379072', '101', 2000.00, '6', 2, '扁鹊', '扁鹊', '2020-06-12 08:29:09', '2020-06-12 08:28:40', '2020-06-12 16:28:49', '扁鹊', '', '222');
INSERT INTO `stock_purchase` VALUES ('CG1272373964395642880', '104', 600.00, '2', 2, '扁鹊', NULL, NULL, '2020-06-15 03:43:04', '2020-06-15 11:43:04', '扁鹊', '', NULL);

-- ----------------------------
-- Table structure for stock_purchase_item
-- ----------------------------
DROP TABLE IF EXISTS `stock_purchase_item`;
CREATE TABLE `stock_purchase_item`  (
  `item_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详情ID',
  `purchase_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '采购单据ID',
  `medicines_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '药品ID',
  `purchase_number` int(10) NULL DEFAULT NULL COMMENT '采购数量',
  `trade_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '批发价',
  `trade_total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '批发额',
  `batch_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '药品生产批次号',
  `remark` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `medicines_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品名称',
  `medicines_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '药品分类 sys_dict_data表his_medicines_type',
  `prescription_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '处方类型 sys_dict_data表his_prescription_type',
  `producter_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '生产厂家ID',
  `conversion` int(10) NULL DEFAULT 1 COMMENT '换算量',
  `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '单位（g/条）',
  `keywords` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键字',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_purchase_item
-- ----------------------------
INSERT INTO `stock_purchase_item` VALUES ('1264762105261850624', 'CG1264752330314743808', '1', 20, 2.00, 40.00, '1', '1', '阿胶珠', '1', '1', '1', 1, 'g', 'ajz');
INSERT INTO `stock_purchase_item` VALUES ('1264762105278627840', 'CG1264752330314743808', '2', 20, 2.00, 40.00, '2', '2', '醋艾炭', '1', '1', '2', 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1271356423200178176', 'CG1271356147747651584', '2', 10, 20.00, 200.00, '21', '21', '醋艾炭', '1', '1', '2', 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1271358744239931392', 'CG1271358119477379072', '1', 100, 10.00, 1000.00, '1', '1', '阿胶珠', '1', '1', '1', 1, 'g', 'ajz');
INSERT INTO `stock_purchase_item` VALUES ('1271358744252514304', 'CG1271358119477379072', '2', 100, 10.00, 1000.00, '2', '2', '醋艾炭', '1', '1', '2', 1, 'g', 'cat');
INSERT INTO `stock_purchase_item` VALUES ('1272374036281819136', 'CG1272373964395642880', '8', 10, 20.00, 200.00, '1', '1', '白英', '1', '1', '1', 1, 'g', 'by');
INSERT INTO `stock_purchase_item` VALUES ('1272374036294402048', 'CG1272373964395642880', '10', 10, 20.00, 200.00, '1', '1', '炒牵牛子', '1', '1', '1', 1, 'g', 'cqnz');
INSERT INTO `stock_purchase_item` VALUES ('1272374036306984960', 'CG1272373964395642880', '9', 10, 20.00, 200.00, '1', '1', '白芷', '1', '1', '1', 1, 'g', 'bz');

-- ----------------------------
-- Table structure for sys_check_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_check_item`;
CREATE TABLE `sys_check_item`  (
  `check_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目费用ID',
  `check_item_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '项目名称',
  `keywords` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键字【查询用】',
  `unit_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '项目单价',
  `cost` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '项目成本',
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位',
  `type_id` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '项目类别IDsxt_sys_dict_type',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态0正常1停用 sxt_sys_dict_type',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`check_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '检查费用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_check_item
-- ----------------------------
INSERT INTO `sys_check_item` VALUES (1, '乙肝五项', 'ygwx', 30.00, 10.00, '次', '2', '0', '2020-05-03 17:52:53', '2020-05-22 18:02:21', '超级管理员', '超级管理员');
INSERT INTO `sys_check_item` VALUES (2, '血常规', 'xcg', 5.00, 1.00, '次', '2', '0', '2020-05-03 18:01:07', '2020-05-22 18:02:24', '超级管理员', '');
INSERT INTO `sys_check_item` VALUES (3, 'CT', 'ct', 50.00, 10.00, '次', '1', '0', '2020-05-03 18:01:37', '2020-05-22 18:02:25', '超级管理员', '');
INSERT INTO `sys_check_item` VALUES (4, 'X光', 'xg', 20.00, 5.00, '次', '1', '0', '2020-05-03 18:01:59', '2020-05-22 18:02:29', '超级管理员', '');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门科室id',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `reg_number` int(11) NULL DEFAULT 0 COMMENT '挂号编号',
  `dept_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '科室编号',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `dept_leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `leader_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0正常 1删除）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门/科室表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (101, '内科', 18, 'HIS-NK', 1, '雷哥', '15902738715', '0', '0', '2018-03-16 11:33:00', '2020-05-20 16:48:24', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (102, '外科', 0, 'HIS-WK', 2, '雷哥', '15902738715', '0', '0', '2018-03-16 11:33:00', '2020-05-20 16:48:24', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (103, '儿科', 0, 'HIS-EK', 3, '雷哥', '15902738715', '0', '0', '2018-03-16 11:33:00', '2020-05-20 16:48:24', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (104, '妇科', 0, 'HIS-FK', 4, '雷哥', '15902738715', '0', '0', '2018-03-16 11:33:00', '2020-05-20 16:48:25', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (105, '眼科', 0, 'HIS-YK', 5, '雷哥', '15902738715', '0', '0', '2018-03-16 11:33:00', '2020-05-20 16:48:25', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (106, '耳鼻侯科', 0, 'HIS-EBHK', 6, '雷哥', '15902738715', '0', '0', '2018-03-16 11:33:00', '2020-05-20 16:48:25', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (107, '口腔科', 0, 'HIS-KQK', 7, '雷哥', '15902738715', '0', '0', '2018-03-16 11:33:00', '2020-05-20 16:48:26', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (108, '皮肤科', 0, 'HIS-PFK', 8, '雷哥', '15902738715', '0', '0', '2018-03-16 11:33:00', '2020-05-20 16:48:26', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (109, '其它', 0, 'HIS-OTHER', 9, '雷哥', '15902738715', '0', '0', '2020-04-21 00:58:20', '2020-05-20 16:48:27', 'admin', 'admin');
INSERT INTO `sys_dept` VALUES (110, '1', 0, '12', 0, '12', '12', '0', '1', '2020-06-12 07:30:42', '2020-06-12 15:30:50', '扁鹊', '扁鹊');
INSERT INTO `sys_dept` VALUES (111, '1', 0, '1', 0, '1', '1', '0', '1', '2020-06-12 08:01:49', '2020-06-12 16:01:54', '扁鹊', '');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '0', '性别男', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:15:32');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '0', '性别女', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:15:35');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '0', '性别未知', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:15:44');
INSERT INTO `sys_dict_data` VALUES (4, 1, '正常', '0', 'sys_normal_disable', '0', '正常状态', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:14:05');
INSERT INTO `sys_dict_data` VALUES (5, 2, '停用', '1', 'sys_normal_disable', '0', '停用状态', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:14:05');
INSERT INTO `sys_dict_data` VALUES (6, 1, '是', 'Y', 'sys_yes_no', '0', '系统默认是', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:14:06');
INSERT INTO `sys_dict_data` VALUES (7, 2, '否', 'N', 'sys_yes_no', '0', '系统默认否', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:14:06');
INSERT INTO `sys_dict_data` VALUES (8, 1, '成功', '0', 'sys_common_status', '0', '成功状态', 'admin', '2018-03-16 11:33:00', 'admin', '2020-05-03 23:51:54');
INSERT INTO `sys_dict_data` VALUES (9, 2, '失败', '1', 'sys_common_status', '0', '失败状态', 'admin', '2018-03-16 11:33:00', 'admin', '2020-05-03 23:51:57');
INSERT INTO `sys_dict_data` VALUES (10, 1, '专科', '1', 'sys_user_background', '0', '用户背景', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:25');
INSERT INTO `sys_dict_data` VALUES (11, 2, '本科', '2', 'sys_user_background', '0', '用户背景', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:29');
INSERT INTO `sys_dict_data` VALUES (12, 3, '研究生', '3', 'sys_user_background', '0', '用户背景', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:29');
INSERT INTO `sys_dict_data` VALUES (13, 4, '博士', '4', 'sys_user_background', '0', '用户背景', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:31');
INSERT INTO `sys_dict_data` VALUES (14, 5, '博士后', '5', 'sys_user_background', '0', '用户背景', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:33');
INSERT INTO `sys_dict_data` VALUES (15, 6, '研究员', '6', 'sys_user_background', '0', '用户背景', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:34');
INSERT INTO `sys_dict_data` VALUES (16, 1, '主任医师', '1', 'sys_user_level', '0', '用户级别', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:45');
INSERT INTO `sys_dict_data` VALUES (17, 2, '副主任医师', '2', 'sys_user_level', '0', '用户级别', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:46');
INSERT INTO `sys_dict_data` VALUES (18, 3, '医师', '3', 'sys_user_level', '0', '用户级别', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:47');
INSERT INTO `sys_dict_data` VALUES (19, 4, '助理医师', '4', 'sys_user_level', '0', '用户级别', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:47');
INSERT INTO `sys_dict_data` VALUES (20, 5, '实习医师', '5', 'sys_user_level', '0', '用户级别', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:48');
INSERT INTO `sys_dict_data` VALUES (21, 6, '主管护士', '6', 'sys_user_level', '0', '用户级别', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:51');
INSERT INTO `sys_dict_data` VALUES (22, 7, '护士', '7', 'sys_user_level', '0', '用户级别', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:52');
INSERT INTO `sys_dict_data` VALUES (23, 8, '其它', '8', 'sys_user_level', '0', '用户级别', 'admin', '2020-04-21 00:13:24', 'admin', '2020-04-21 00:14:55');
INSERT INTO `sys_dict_data` VALUES (29, 1, '未提交', '1', 'his_order_status', '0', '入库单状态', 'admin', '2020-04-21 00:13:24', 'admin', '2020-05-10 01:54:58');
INSERT INTO `sys_dict_data` VALUES (30, 2, '待审核', '2', 'his_order_status', '0', '入库单状态', 'admin', '2020-04-21 00:13:24', 'admin', '2020-05-10 01:55:02');
INSERT INTO `sys_dict_data` VALUES (31, 3, '审核通过', '3', 'his_order_status', '0', '入库单状态', 'admin', '2020-04-21 00:13:24', 'admin', '2020-05-10 01:55:04');
INSERT INTO `sys_dict_data` VALUES (32, 4, '审核失败', '4', 'his_order_status', '0', '入库单状态', 'admin', '2020-04-21 00:13:24', 'admin', '2020-05-10 01:55:08');
INSERT INTO `sys_dict_data` VALUES (33, 5, '作废', '5', 'his_order_status', '0', '入库单状态', 'admin', '2020-04-21 00:13:24', 'admin', '2020-05-10 01:55:14');
INSERT INTO `sys_dict_data` VALUES (34, 6, '入库成功', '6', 'his_order_status', '0', '入库成功', 'admin', '2020-04-21 00:13:24', 'admin', '2020-05-10 01:55:53');
INSERT INTO `sys_dict_data` VALUES (36, 1, '通知', '0', 'sys_notice_type', '0', '通知状态', 'admin', '2020-04-21 00:13:24', 'admin', '2020-05-09 15:30:50');
INSERT INTO `sys_dict_data` VALUES (37, 2, '公告', '1', 'sys_notice_type', '0', '公告状态', 'admin', '2020-04-21 00:13:24', 'admin', '2020-05-09 15:30:48');
INSERT INTO `sys_dict_data` VALUES (38, 1, '系统用户', '0', 'sys_user_type', '0', '系统用户', '超级管理员', '2020-05-02 14:59:51', '', '2020-05-09 15:30:45');
INSERT INTO `sys_dict_data` VALUES (39, 0, '患者用户', '1', 'sys_user_type', '0', '患者用户', '超级管理员', '2020-05-02 15:00:04', '', '2020-05-09 15:30:40');
INSERT INTO `sys_dict_data` VALUES (40, 1, '新增', '1', 'sys_oper_type', '0', '新增', '超级管理员', '2020-05-03 15:16:10', '', '2020-05-09 15:30:26');
INSERT INTO `sys_dict_data` VALUES (41, 2, '修改', '2', 'sys_oper_type', '0', '修改', '超级管理员', '2020-05-03 15:16:27', '', '2020-05-09 15:30:23');
INSERT INTO `sys_dict_data` VALUES (42, 3, '删除', '3', 'sys_oper_type', '0', '删除', '超级管理员', '2020-05-03 15:16:49', '', '2020-05-09 15:30:15');
INSERT INTO `sys_dict_data` VALUES (43, 4, '授权', '4', 'sys_oper_type', '0', '授权', '超级管理员', '2020-05-03 15:17:04', '', '2020-05-09 15:29:58');
INSERT INTO `sys_dict_data` VALUES (44, 5, '导出', '5', 'sys_oper_type', '0', '导出', '超级管理员', '2020-05-03 15:17:17', '', '2020-05-09 15:29:51');
INSERT INTO `sys_dict_data` VALUES (45, 6, '导入', '6', 'sys_oper_type', '0', '导入', '超级管理员', '2020-05-03 15:17:47', '', '2020-05-09 15:29:50');
INSERT INTO `sys_dict_data` VALUES (46, 0, '退出', '7', 'sys_oper_type', '0', '退出', '超级管理员', '2020-05-03 15:18:09', '', '2020-05-09 15:29:49');
INSERT INTO `sys_dict_data` VALUES (47, 8, '清空数据', '8', 'sys_oper_type', '0', '清空数据', '超级管理员', '2020-05-03 15:18:40', '', '2020-05-09 15:29:47');
INSERT INTO `sys_dict_data` VALUES (48, 1, '拍片类', '1', 'his_inspection_type', '0', '拍片类', '超级管理员', '2020-05-03 17:07:48', '超级管理员', '2020-05-09 15:29:46');
INSERT INTO `sys_dict_data` VALUES (49, 2, '化验类', '2', 'his_inspection_type', '0', '化验类', '超级管理员', '2020-05-03 17:08:14', '', '2020-05-09 15:29:44');
INSERT INTO `sys_dict_data` VALUES (50, 1, '中药处方', '1', 'his_prescription_type', '0', '中药处方', '超级管理员', '2020-05-03 18:20:21', '', '2020-05-09 15:29:42');
INSERT INTO `sys_dict_data` VALUES (51, 2, '西药处方', '2', 'his_prescription_type', '0', '西药处方', '超级管理员', '2020-05-03 18:20:31', '', '2020-05-09 15:29:41');
INSERT INTO `sys_dict_data` VALUES (52, 1, '中草药', '1', 'his_medicines_type', '0', '中草药', '超级管理员', '2020-05-03 18:27:03', '', '2020-05-09 15:29:38');
INSERT INTO `sys_dict_data` VALUES (53, 2, '儿科用药', '2', 'his_medicines_type', '0', '儿科用药', '超级管理员', '2020-05-03 18:28:09', '', '2020-05-09 15:29:37');
INSERT INTO `sys_dict_data` VALUES (54, 3, '耳鼻喉科用药', '3', 'his_medicines_type', '0', '耳鼻喉科用药', '超级管理员', '2020-05-03 18:28:40', '', '2020-05-09 15:29:36');
INSERT INTO `sys_dict_data` VALUES (55, 4, '抗生素类抗感染药物', '4', 'his_medicines_type', '0', '抗生素类抗感染药物', '超级管理员', '2020-05-03 18:29:05', '', '2020-05-09 15:29:35');
INSERT INTO `sys_dict_data` VALUES (56, 5, '妇科用药', '5', 'his_medicines_type', '0', '妇科用药', '超级管理员', '2020-05-03 18:29:28', '', '2020-05-09 15:29:33');
INSERT INTO `sys_dict_data` VALUES (57, 6, '骨伤科用药', '6', 'his_medicines_type', '0', '骨伤科用药', '超级管理员', '2020-05-03 18:29:50', '', '2020-05-09 15:29:31');
INSERT INTO `sys_dict_data` VALUES (58, 7, '呼吸系统用药物', '7', 'his_medicines_type', '0', '呼吸系统用药物', '超级管理员', '2020-05-03 18:30:09', '', '2020-05-09 15:29:30');
INSERT INTO `sys_dict_data` VALUES (59, 8, '激素类药', '8', 'his_medicines_type', '0', '激素类药', '超级管理员', '2020-05-03 18:30:43', '', '2020-05-09 15:29:29');
INSERT INTO `sys_dict_data` VALUES (60, 9, '解热镇痛药物', '9', 'his_medicines_type', '0', '解热镇痛药物', '超级管理员', '2020-05-03 18:31:04', '', '2020-05-09 15:29:28');
INSERT INTO `sys_dict_data` VALUES (61, 10, '抗肿瘤药物', '10', 'his_medicines_type', '0', '抗肿瘤药物', '超级管理员', '2020-05-03 18:32:02', '', '2020-05-09 15:29:26');
INSERT INTO `sys_dict_data` VALUES (63, 1, '门诊', '1', 'his_scheduling_type', '0', '门诊', '超级管理员', '2020-05-12 03:14:06', '', '2020-05-12 11:25:19');
INSERT INTO `sys_dict_data` VALUES (64, 2, '急诊', '2', 'his_scheduling_type', '0', '急诊', '超级管理员', '2020-05-12 03:14:18', '', '2020-05-12 11:24:39');
INSERT INTO `sys_dict_data` VALUES (65, 1, '上午', '1', 'his_subsection_type', '0', '上午', '超级管理员', '2020-05-12 07:31:25', '', '2020-05-12 15:31:25');
INSERT INTO `sys_dict_data` VALUES (66, 2, '下午', '2', 'his_subsection_type', '0', '下午', '超级管理员', '2020-05-12 07:31:33', '', '2020-05-12 15:31:33');
INSERT INTO `sys_dict_data` VALUES (67, 3, '晚上', '3', 'his_subsection_type', '0', '晚上', '超级管理员', '2020-05-12 07:31:42', '', '2020-05-12 15:31:41');
INSERT INTO `sys_dict_data` VALUES (68, 1, '未完善', '0', 'his_patient_msg_final', '0', '未完善', '超级管理员', '2020-05-14 06:31:23', '超级管理员', '2020-05-14 14:31:23');
INSERT INTO `sys_dict_data` VALUES (69, 2, '已完善', '1', 'his_patient_msg_final', '0', '已完善', '超级管理员', '2020-05-14 06:31:40', '', '2020-05-14 14:31:39');
INSERT INTO `sys_dict_data` VALUES (70, 1, '未收费', '0', 'his_registration_status', '0', '未收费', '超级管理员', '2020-05-20 07:44:45', '', '2020-05-20 15:44:44');
INSERT INTO `sys_dict_data` VALUES (71, 2, '待就诊', '1', 'his_registration_status', '0', '待就诊', '超级管理员', '2020-05-20 07:45:01', '', '2020-05-20 15:45:01');
INSERT INTO `sys_dict_data` VALUES (72, 3, '就诊中', '2', 'his_registration_status', '0', '就诊中', '超级管理员', '2020-05-20 07:45:17', '', '2020-05-20 15:45:16');
INSERT INTO `sys_dict_data` VALUES (73, 4, '就诊完成', '3', 'his_registration_status', '0', '就诊完成', '超级管理员', '2020-05-20 07:45:31', '', '2020-05-20 15:45:31');
INSERT INTO `sys_dict_data` VALUES (74, 5, '已退号', '4', 'his_registration_status', '0', '已退号', '超级管理员', '2020-05-20 07:45:42', '', '2020-05-20 15:45:42');
INSERT INTO `sys_dict_data` VALUES (75, 6, '作废', '5', 'his_registration_status', '0', '作废', '超级管理员', '2020-05-20 07:46:01', '', '2020-05-20 15:46:00');
INSERT INTO `sys_dict_data` VALUES (76, 1, '初诊', '0', 'his_receive_type', '0', '初诊', '扁鹊', '2020-05-22 06:21:08', '', '2020-05-22 14:21:07');
INSERT INTO `sys_dict_data` VALUES (77, 2, '复诊', '1', 'his_receive_type', '0', '复诊', '扁鹊', '2020-05-22 06:21:20', '', '2020-05-22 14:21:19');
INSERT INTO `sys_dict_data` VALUES (78, 1, '否', '0', 'his_contagious_status', '0', '否', '扁鹊', '2020-05-22 06:21:44', '', '2020-05-22 14:21:44');
INSERT INTO `sys_dict_data` VALUES (79, 2, '是', '1', 'his_contagious_status', '0', '是', '扁鹊', '2020-05-22 06:21:54', '', '2020-05-22 14:21:53');
INSERT INTO `sys_dict_data` VALUES (80, 1, '未支付', '0', 'his_order_details_status', '0', '未支付', '扁鹊', '2020-05-27 09:22:06', '', '2020-06-04 11:35:16');
INSERT INTO `sys_dict_data` VALUES (81, 2, '已支付', '1', 'his_order_details_status', '0', '已支付', '扁鹊', '2020-05-27 09:22:18', '', '2020-06-04 11:35:20');
INSERT INTO `sys_dict_data` VALUES (82, 3, '已退费', '2', 'his_order_details_status', '0', '已退费', '扁鹊', '2020-05-27 09:22:18', '', '2020-06-04 11:35:21');
INSERT INTO `sys_dict_data` VALUES (83, 4, '已完成', '3', 'his_order_details_status', '0', '已完成=已检查和已发药', '扁鹊', '2020-05-27 09:22:18', '', '2020-06-04 11:36:13');
INSERT INTO `sys_dict_data` VALUES (84, 1, '检测中', '0', 'his_check_result_status', '0', '检测中', '扁鹊', '2020-05-29 10:09:34', '', '2020-06-04 11:32:56');
INSERT INTO `sys_dict_data` VALUES (85, 2, '检测完成', '1', 'his_check_result_status', '0', '检测完成', '扁鹊', '2020-05-29 10:09:51', '', '2020-06-04 11:32:54');
INSERT INTO `sys_dict_data` VALUES (86, 1, '未支付', '0', 'his_order_charge_status', '0', '未支付', '扁鹊', '2020-06-03 08:56:11', '', '2020-06-04 11:35:45');
INSERT INTO `sys_dict_data` VALUES (87, 2, '支付成功', '1', 'his_order_charge_status', '0', '支付成功', '扁鹊', '2020-06-03 08:56:22', '', '2020-06-04 11:35:47');
INSERT INTO `sys_dict_data` VALUES (88, 3, '支付超时', '2', 'his_order_charge_status', '0', '支付超时', '扁鹊', '2020-06-03 08:56:34', '', '2020-06-04 11:35:49');
INSERT INTO `sys_dict_data` VALUES (89, 4, '支付失败', '3', 'his_order_charge_status', '0', '支付失败', '扁鹊', '2020-06-03 08:56:46', '', '2020-06-04 11:35:51');
INSERT INTO `sys_dict_data` VALUES (90, 1, '未退费', '0', 'his_backfee_status', '0', '未退费', '扁鹊', '2020-06-05 09:56:48', '', '2020-06-05 17:56:48');
INSERT INTO `sys_dict_data` VALUES (91, 2, '已退费', '1', 'his_backfee_status', '0', '已退费', '扁鹊', '2020-06-05 09:57:11', '', '2020-06-05 17:57:10');
INSERT INTO `sys_dict_data` VALUES (92, 3, '退费失败', '2', 'his_backfee_status', '0', '退费失败', '扁鹊', '2020-06-05 09:57:22', '', '2020-06-05 17:57:21');
INSERT INTO `sys_dict_data` VALUES (93, 1, '现金', '0', 'his_pay_type_status', '0', '现金', '扁鹊', '2020-06-11 02:59:48', '', '2020-06-11 10:59:48');
INSERT INTO `sys_dict_data` VALUES (94, 2, '支付宝', '1', 'his_pay_type_status', '0', '支付宝', '扁鹊', '2020-06-11 03:00:01', '', '2020-06-11 11:00:01');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:21:24', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-05-03 23:23:48', '系统状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:21:28', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (4, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-05-03 23:24:19', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (5, '学历', 'sys_user_background', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:21:53', '学历列表');
INSERT INTO `sys_dict_type` VALUES (6, '医生级别', 'sys_user_level', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:21:55', '医生级别列表');
INSERT INTO `sys_dict_type` VALUES (7, '入库单状态', 'his_order_status', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:21:56', '入库单状态列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-21 00:21:56', '通知类型');
INSERT INTO `sys_dict_type` VALUES (9, '用户类型', 'sys_user_type', '0', '超级管理员', '2020-05-02 14:59:35', '', '2020-05-03 23:25:22', '用户类型');
INSERT INTO `sys_dict_type` VALUES (10, '操作类型', 'sys_oper_type', '0', '超级管理员', '2020-05-03 15:13:36', '', '2020-05-03 23:25:24', '操作日志类型');
INSERT INTO `sys_dict_type` VALUES (11, '检查项目类型', 'his_inspection_type', '0', '超级管理员', '2020-05-03 16:58:32', '', '2020-05-04 00:59:56', '检查项目类型');
INSERT INTO `sys_dict_type` VALUES (18, '处方类型', 'his_prescription_type', '0', '超级管理员', '2020-05-03 18:20:04', '', '2020-05-04 02:20:03', '处方类型');
INSERT INTO `sys_dict_type` VALUES (19, '药品分类', 'his_medicines_type', '0', '超级管理员', '2020-05-03 18:26:43', '', '2020-05-04 02:26:42', '药品分类');
INSERT INTO `sys_dict_type` VALUES (21, '排班类型', 'his_scheduling_type', '0', '超级管理员', '2020-05-12 03:13:32', '超级管理员', '2020-05-12 11:13:31', '排班类型');
INSERT INTO `sys_dict_type` VALUES (22, '排班时段', 'his_subsection_type', '0', '超级管理员', '2020-05-12 07:31:02', '', '2020-05-12 15:31:02', '排班时段');
INSERT INTO `sys_dict_type` VALUES (23, '患者信息完善状态', 'his_patient_msg_final', '0', '超级管理员', '2020-05-14 06:31:06', '', '2020-05-14 14:31:06', '患者信息完善状态');
INSERT INTO `sys_dict_type` VALUES (24, '挂号单类型', 'his_registration_status', '0', '超级管理员', '2020-05-20 07:44:25', '', '2020-05-20 15:44:25', '挂号单类型');
INSERT INTO `sys_dict_type` VALUES (25, '接诊类型', 'his_receive_type', '0', '扁鹊', '2020-05-22 06:19:55', '', '2020-05-22 14:19:55', '接诊类型');
INSERT INTO `sys_dict_type` VALUES (26, '是否传染', 'his_contagious_status', '0', '扁鹊', '2020-05-22 06:20:32', '', '2020-05-22 14:20:31', '是否传染');
INSERT INTO `sys_dict_type` VALUES (27, '订单和处方详情状态', 'his_order_details_status', '0', '扁鹊', '2020-05-27 09:21:48', '', '2020-06-04 11:36:43', '处方详情支付状态');
INSERT INTO `sys_dict_type` VALUES (28, '检查状态', 'his_check_result_status', '0', '扁鹊', '2020-05-29 10:09:17', '', '2020-05-29 18:09:16', '检查状态');
INSERT INTO `sys_dict_type` VALUES (29, '订单状态', 'his_order_charge_status', '0', '扁鹊', '2020-06-03 08:55:48', '', '2020-06-03 16:55:48', '订单状态');
INSERT INTO `sys_dict_type` VALUES (30, '退费状态', 'his_backfee_status', '0', '扁鹊', '2020-06-05 09:56:02', '', '2020-06-05 17:56:01', '退费表退费状态');
INSERT INTO `sys_dict_type` VALUES (31, '收费退费类型', 'his_pay_type_status', '0', '扁鹊', '2020-06-11 02:59:31', '', '2020-06-11 10:59:31', '收费退费类型');

-- ----------------------------
-- Table structure for sys_login_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_info`;
CREATE TABLE `sys_login_info`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户名称',
  `login_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登陆账号',
  `ip_addr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作系统',
  `login_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）字典表',
  `login_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登陆类型0系统用户1患者用户 字典表',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 245 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `parent_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '父节点ID集合',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `percode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '路由地址',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, NULL, '系统管理', 'M', NULL, '/system', '系统管理', '0', '2020-04-21 16:25:40', '2020-04-23 00:36:16', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (2, 0, NULL, '数据统计', 'M', NULL, '/statistics', '数据统计', '0', '2020-04-21 16:25:40', '2020-04-23 00:36:18', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (3, 0, NULL, '药品进销存', 'M', NULL, '/stock', '药品进销存', '0', '2020-04-21 16:25:40', '2020-05-04 21:23:04', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (4, 0, NULL, '收费管理', 'M', NULL, '/charge', '收费管理', '0', '2020-04-21 16:25:40', '2020-04-24 22:18:53', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (5, 0, NULL, '检查管理', 'M', NULL, '/check', '检查管理', '0', '2020-04-21 16:25:40', '2020-05-29 15:02:01', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (6, 0, NULL, '看病就诊', 'M', NULL, '/doctor', '看病就诊', '0', '2020-04-21 16:25:40', '2020-05-29 14:44:39', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (7, 1, '1', '科室管理', 'C', NULL, '/system/dept', '科室管理', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:13', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (8, 1, '1', '用户管理', 'C', NULL, '/system/user', '用户管理', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:15', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (9, 1, '1', '角色管理', 'C', NULL, '/system/role', '角色管理', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:17', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (10, 1, '1', '菜单管理', 'C', NULL, '/system/menu', '菜单管理', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:18', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (11, 1, '1', '字典管理', 'C', NULL, '/system/dict', '字典管理', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:19', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (12, 1, '1', '通知公告', 'C', NULL, '/system/notice', '通知公告', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:20', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (13, 1, '1', '登陆日志管理', 'C', NULL, '/system/log_login', '登陆日志管理', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:21', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (14, 1, '1', '操作日志管理', 'C', NULL, '/system/log_opt', '操作日志管理', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:22', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (15, 1, '1', '检查费用设置', 'C', NULL, '/system/ins_fee', '检查费用设置', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:23', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (16, 1, '1', '挂号费用设置', 'C', NULL, '/system/reg_fee', '挂号费用设置', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:24', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (17, 2, '2', '收支统计', 'C', NULL, '/statistics/revenue', '收支统计', '0', '2020-04-21 16:25:40', '2020-06-10 16:36:03', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (18, 2, '2', '药品销售统计', 'C', NULL, '/statistics/sales', '药品销售统计', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:26', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (19, 2, '2', '检查项目统计', 'C', NULL, '/statistics/check', '检查项目统计', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:27', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (20, 2, '2', '年月报表统计', 'C', NULL, '/statistics/yearmonth', '年月报表统计', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:29', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (21, 2, '2', '工作量统计', 'C', NULL, '/statistics/workload', '工作量统计', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:31', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (22, 3, '3', '厂家信息维护', 'C', NULL, '/stock/producter', '厂家信息维护', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:32', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (23, 3, '3', '药品信息维护', 'C', NULL, '/stock/medicinal', '药品信息维护', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:33', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (24, 3, '3', '供应商维护', 'C', NULL, '/stock/provider', '供应商维护', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:34', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (25, 3, '3', '采购入库', 'C', NULL, '/stock/purchase', '采购入库', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:35', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (26, 3, '3', '入库审核', 'C', NULL, '/stock/examine', '入库审核', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:36', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (27, 3, '3', '库存查询', 'C', NULL, '/stock/inventory', '库存查询', '0', '2020-04-21 16:25:40', '2020-05-29 14:46:37', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (28, 4, '4', '处方收费', 'C', NULL, '/charge/docharge', '处方收费', '0', '2020-04-21 16:25:40', '2020-06-03 15:26:55', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (29, 4, '4', '收费列表', 'C', NULL, '/charge/chargelist', '收费列表', '0', '2020-04-21 16:25:40', '2020-06-03 15:25:21', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (30, 4, '4', '处方退费', 'C', NULL, '/charge/backfee', '处方退费', '0', '2020-04-21 16:25:40', '2020-06-03 15:27:04', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (31, 4, '4', '退费查询', 'C', NULL, '/charge/backfeelist', '退费查询', '0', '2020-04-21 16:25:40', '2020-06-03 15:25:02', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (32, 4, '4', '处方发药', 'C', NULL, '/charge/dispensing', '处方发药', '0', '2020-04-21 16:25:40', '2020-06-03 15:26:20', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (33, 5, '6', '新开检查', 'C', NULL, '/check/docheck', '新开检查', '0', '2020-04-21 16:25:40', '2020-06-03 15:26:17', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (34, 5, '6', '检查结果录入', 'C', NULL, '/check/checkresult', '检查结果录入', '0', '2020-04-21 16:25:40', '2020-06-03 15:26:16', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (35, 5, '6', '检查结果查询', 'C', NULL, '/check/checklist', '检查结果查询', '0', '2020-04-21 16:25:40', '2020-06-03 15:26:14', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (36, 6, '6', '门诊挂号', 'C', NULL, '/doctor/registered', '门诊挂号', '0', '2020-04-21 16:25:40', '2020-06-03 15:26:12', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (37, 6, '6', '挂号列表', 'C', NULL, '/doctor/registeredlist', '挂号列表', '0', '2020-04-21 16:25:40', '2020-06-03 15:26:10', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (38, 6, '6', '新开就诊', 'C', NULL, '/doctor/newcare', '就开就诊', '0', '2020-04-21 16:25:40', '2020-06-03 15:26:09', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (39, 6, '6', '就诊列表', 'C', NULL, '/doctor/carelist', '就诊列表', '0', '2020-04-21 16:25:40', '2020-06-03 15:26:06', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (40, 6, '6', '我的排班', 'C', NULL, '/doctor/myscheduling', '我的排班', '0', '2020-04-21 16:25:40', '2020-06-03 15:26:02', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (41, 6, '6', '医生排班', 'C', NULL, '/doctor/scheduling', '医生排班', '0', '2020-04-21 16:25:40', '2020-06-03 15:25:59', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES (42, 6, '6', '患者库', 'C', NULL, '/doctor/patient', '患者库', '0', '2020-04-21 16:25:40', '2020-06-03 15:25:56', 'admin', 'admin');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：尚学堂HIS发布啦', '0', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2020年5月1日HIS系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作人员',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_registered_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_registered_item`;
CREATE TABLE `sys_registered_item`  (
  `reg_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '挂号项ID',
  `reg_item_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号项目名称',
  `reg_item_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0正常 1删除）',
  PRIMARY KEY (`reg_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_registered_item
-- ----------------------------
INSERT INTO `sys_registered_item` VALUES (1, '门诊', 6.00, '2020-05-11 07:44:49', '2020-05-11 15:44:49', '超级管理员', '', '0', '0');
INSERT INTO `sys_registered_item` VALUES (2, '门诊+病例本', 7.00, '2020-05-11 07:45:30', '2020-05-11 15:45:29', '超级管理员', '', '0', '0');
INSERT INTO `sys_registered_item` VALUES (3, '急诊', 12.00, '2020-05-11 07:45:42', '2020-05-11 15:45:42', '超级管理员', '', '0', '0');
INSERT INTO `sys_registered_item` VALUES (4, '急诊+病例本', 13.00, '2020-05-11 07:45:57', '2020-05-11 15:45:57', '超级管理员', '', '0', '0');
INSERT INTO `sys_registered_item` VALUES (6, '1111', 0.00, '2020-05-11 07:51:37', '2020-05-11 15:53:48', '超级管理员', '', '0', '1');
INSERT INTO `sys_registered_item` VALUES (7, '11112222', 1.00, '2020-05-11 07:51:43', '2020-05-11 15:53:46', '超级管理员', '超级管理员', '0', '1');
INSERT INTO `sys_registered_item` VALUES (8, '111122', 222.00, '2020-05-11 07:51:51', '2020-05-11 15:53:45', '超级管理员', '', '0', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色权限编码',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'role:admin', 1, '管理员', '0', '2018-03-16 11:33:00', '2020-04-23 22:41:02', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (2, '医生', 'role:doctor', 2, '普通角色', '0', '2018-03-16 11:33:00', '2020-04-23 22:41:09', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (3, '护士', 'role:hs', 3, '普通角色', '0', '2018-03-16 11:33:00', '2020-04-29 01:42:09', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (4, '挂号员', 'role:ghy', 4, '普通角色', '0', '2018-03-16 11:33:00', '2020-04-23 22:41:19', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (5, '	收费员', 'role:sfy', 5, '普通角色', '0', '2018-03-16 11:33:00', '2020-04-23 22:41:23', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (6, '	发药员', 'role:fyy', 6, '普通角色', '0', '2018-03-16 11:33:00', '2020-04-23 22:41:28', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (7, '	财务', 'role:cw', 7, '普通角色', '0', '2018-03-16 11:33:00', '2020-04-23 22:41:32', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (8, '	其他人员', 'role:other', 8, '普通角色', '0', '2018-03-16 11:33:00', '2020-04-23 22:41:40', 'admin', 'admin', '0');
INSERT INTO `sys_role` VALUES (9, '1', '12', 0, '1', '0', '2020-06-12 08:03:04', '2020-06-12 16:03:10', '扁鹊', '扁鹊', '1');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 9);
INSERT INTO `sys_role_menu` VALUES (2, 10);
INSERT INTO `sys_role_menu` VALUES (2, 11);
INSERT INTO `sys_role_menu` VALUES (2, 12);
INSERT INTO `sys_role_menu` VALUES (2, 13);
INSERT INTO `sys_role_menu` VALUES (2, 14);
INSERT INTO `sys_role_menu` VALUES (2, 15);
INSERT INTO `sys_role_menu` VALUES (2, 16);
INSERT INTO `sys_role_menu` VALUES (2, 17);
INSERT INTO `sys_role_menu` VALUES (2, 18);
INSERT INTO `sys_role_menu` VALUES (2, 19);
INSERT INTO `sys_role_menu` VALUES (2, 20);
INSERT INTO `sys_role_menu` VALUES (2, 21);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (2, 1);
INSERT INTO `sys_role_user` VALUES (2, 2);
INSERT INTO `sys_role_user` VALUES (2, 3);
INSERT INTO `sys_role_user` VALUES (2, 4);

-- ----------------------------
-- Table structure for sys_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms_log`;
CREATE TABLE `sys_sms_log`  (
  `id` bigint(22) NOT NULL COMMENT '表id',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '验证码',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '0.发送成功1发送失败',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '0注册验证码，1，挂号提醒',
  `error_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送失败的错误信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短息发送记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `user_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '用户类型（0超级用户为 1为系统用户）',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `background` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学历 sys_dict_type:sys_user_background',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `strong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '擅长',
  `honor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '荣誉',
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '简介',
  `user_rank` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '\r\n医生级别sys_dict_type:sys_user_level',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `union_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户授权登录openid 扩展第三方登陆使用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `salt` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '盐',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0正常 1删除）',
  `scheduling_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '是否需要参与排班0需要,1 不需要',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 109, '超级管理员', '0', '0', 108, '', '1', '110', 'admin@163.com', '全科', '神医', '医学奇才', '3', '47a42ee6006fdf69e53de74cfe29072d', '2018-03-16 11:33:00', '127.0.0.1', '0', NULL, NULL, '2018-03-16 11:33:00', '2020-04-30 02:08:57', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '0', '1');
INSERT INTO `sys_user` VALUES (2, 101, '扁鹊', '1', '1', 22, 'http://www.leige.tech:8088/group1/M00/00/00/rBB2Ol7fRmKAZJKhAAAnAemaOoE812.jpg', '1', '13888001001', 'his1@163.com', '全科', '神医', '医学奇才', '1', '02f80d33e1e8aad07fa46280b36d0522', '2018-03-16 11:33:00', '127.0.0.1', '0', NULL, NULL, '2018-03-16 11:33:00', '2020-06-12 15:24:33', 'admin', '超级管理员', '81BF9FF7C91B47A491B76615E408E234', '0', '0');
INSERT INTO `sys_user` VALUES (3, 102, '李时珍', '1', '1', 18, '', '2', '13888001002', 'his2@163.com', '全科', '神医', '医学奇才', '1', '0cebc3ed9f23cc258ae8c65a56a9ee75', '2018-03-16 11:33:00', '127.0.0.1', '0', NULL, NULL, '2018-03-16 11:33:00', '2020-04-30 00:49:52', 'admin', '超级管理员', '93FBC8C44F46480FA6FC115F8E261E81', '0', '0');
INSERT INTO `sys_user` VALUES (4, 103, '孙思邈', '1', '1', 16, '', '3', '13888001003', 'his3@163.com', '全科', '神医', '医学奇才', '1', '8f01277cea0b5db28e6558444cc7987d', '2018-03-16 11:33:00', '127.0.0.1', '0', NULL, NULL, '2018-03-16 11:33:00', '2020-04-30 00:49:58', 'admin', '超级管理员', '19035F127290470C8F533FE2FABCA3EE', '0', '0');
INSERT INTO `sys_user` VALUES (5, 104, '华佗', '1', '1', 22, '', '4', '13888001004', 'his4@163.com', '全科', '神医', '医学奇才', '1', '520a5b05dbec9f937f70092e088058e8', '2018-03-16 11:33:00', '127.0.0.1', '0', NULL, NULL, '2018-03-16 11:33:00', '2020-04-30 00:49:52', 'admin', '超级管理员', '91D53B3C4B8E40C7BA3613E41546AAE1', '0', '0');
INSERT INTO `sys_user` VALUES (6, 105, '皇甫谧', '1', '1', 36, '', '5', '13888001005', 'his5@163.com', '全科', '神医', '医学奇才', '2', 'febeb7fc90866cafa0349de7b0a336e7', '2018-03-16 11:33:00', '127.0.0.1', '0', NULL, NULL, '2018-03-16 11:33:00', '2020-04-30 00:49:59', 'admin', '超级管理员', '4EE266FA0935443B9AE3F131DDAF1C80', '0', '0');
INSERT INTO `sys_user` VALUES (7, 106, '林道飞', '1', '1', 45, '', '6', '13888001006', 'his6@163.com', '全科', '神医', '医学奇才', '2', 'f303a4c24323dbb3210c90f2273da20b', '2018-03-16 11:33:00', '127.0.0.1', '0', NULL, NULL, '2018-03-16 11:33:00', '2020-06-12 16:42:48', 'admin', '扁鹊', 'EC46A74E43414EE4A3600F60146096F4', '0', '1');
INSERT INTO `sys_user` VALUES (8, 107, '熊宗立', '1', '1', 28, '', '1', '13888001007', 'his7@163.com', '全科', '神医', '医学奇才', '2', '0aa3e471f4edb47bc5306cc886e0abb2', '2018-03-16 11:33:00', '127.0.0.1', '0', NULL, NULL, '2018-03-16 11:33:00', '2020-04-30 00:50:02', 'admin', '超级管理员', '9D2252E59A964D888DBD541162FFC1AE', '0', '1');
INSERT INTO `sys_user` VALUES (9, 108, '肖药儿', '1', '0', 99, '', '2', '13888001008', 'his8@163.com', '全科', '神医', '医学奇才', '3', 'a2038c9a1c43b774f75376a924b46ca1', '2018-03-16 11:33:00', '127.0.0.1', '0', NULL, NULL, '2018-03-16 11:33:00', '2020-04-30 00:50:00', 'admin', '超级管理员', '0FB216BE844C4D688340A13AD27D3427', '0', '1');

SET FOREIGN_KEY_CHECKS = 1;
