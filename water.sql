/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50709
 Source Host           : localhost:3306
 Source Schema         : water

 Target Server Type    : MySQL
 Target Server Version : 50709
 File Encoding         : 65001

 Date: 08/10/2018 13:47:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dc_action_logs
-- ----------------------------
DROP TABLE IF EXISTS `dc_action_logs`;
CREATE TABLE `dc_action_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块',
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制器',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '访问时间',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 459593 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_action_logs
-- ----------------------------
INSERT INTO `dc_action_logs` VALUES (458660, 'admin', 'index', 'index', 1538807158, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458661, 'admin', 'index', 'get_dev_mappoint', 1538807158, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458662, 'admin', 'account', 'list', 1538807161, 'superadmin', '{\"_url\":\"admin\\/account\\/list\",\"menuid\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (458663, 'admin', 'index', 'index', 1538807166, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458664, 'admin', 'index', 'get_dev_mappoint', 1538807166, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458665, 'admin', 'index', 'index', 1538807174, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458666, 'admin', 'index', 'get_dev_mappoint', 1538807174, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458667, 'admin', 'index', 'index', 1538807186, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458668, 'admin', 'index', 'get_dev_mappoint', 1538807186, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458669, 'admin', 'account', 'logout', 1538807196, 'superadmin', '{\"_url\":\"admin\\/account\\/logout\",\"tag\":\"\"}');
INSERT INTO `dc_action_logs` VALUES (458670, 'admin', 'account', 'login', 1538807196, NULL, '{\"_url\":\"admin\\/account\\/login\"}');
INSERT INTO `dc_action_logs` VALUES (458671, 'admin', 'account', 'login', 1538807196, NULL, '{\"_url\":\"admin\\/account\\/login\"}');
INSERT INTO `dc_action_logs` VALUES (458672, 'admin', 'account', 'login', 1538807203, NULL, '{\"_url\":\"admin\\/account\\/login\"}');
INSERT INTO `dc_action_logs` VALUES (458673, 'admin', 'account', 'login', 1538807242, NULL, '{\"_url\":\"admin\\/account\\/login\"}');
INSERT INTO `dc_action_logs` VALUES (458674, 'admin', 'index', 'index', 1538807242, 'superadmin', '{\"_url\":\"admin\\/index\\/index\"}');
INSERT INTO `dc_action_logs` VALUES (458675, 'admin', 'index', 'get_dev_mappoint', 1538807242, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458676, 'admin', 'account', 'list', 1538807245, 'superadmin', '{\"_url\":\"admin\\/account\\/list\",\"menuid\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (458677, 'admin', 'index', 'index', 1538807246, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458678, 'admin', 'index', 'get_dev_mappoint', 1538807246, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458679, 'admin', 'account', 'list', 1538807247, 'superadmin', '{\"_url\":\"admin\\/account\\/list\",\"menuid\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (458680, 'admin', 'index', 'index', 1538807248, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458681, 'admin', 'index', 'get_dev_mappoint', 1538807248, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458682, 'admin', 'index', 'index', 1538807299, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458683, 'admin', 'index', 'get_dev_mappoint', 1538807300, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458684, 'admin', 'index', 'index', 1538807302, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458685, 'admin', 'index', 'get_dev_mappoint', 1538807302, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458686, 'admin', 'account', 'list', 1538807304, 'superadmin', '{\"_url\":\"admin\\/account\\/list\",\"menuid\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (458687, 'admin', 'index', 'index', 1538807306, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458688, 'admin', 'index', 'get_dev_mappoint', 1538807306, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458689, 'admin', 'index', 'index', 1538807361, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458690, 'admin', 'index', 'index', 1538807433, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458691, 'admin', 'index', 'index', 1538807449, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458692, 'admin', 'index', 'index', 1538807458, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458693, 'admin', 'index', 'get_dev_mappoint', 1538807458, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458694, 'admin', 'index', 'index', 1538807495, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458695, 'admin', 'index', 'index', 1538807516, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458696, 'admin', 'index', 'index', 1538807841, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458697, 'admin', 'index', 'index', 1538807867, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458698, 'admin', 'index', 'index', 1538807875, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458699, 'admin', 'index', 'index', 1538807909, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458700, 'admin', 'index', 'index', 1538807935, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458701, 'admin', 'index', 'index', 1538807940, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458702, 'admin', 'index', 'index', 1538807942, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458703, 'admin', 'index', 'index', 1538807942, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458704, 'admin', 'index', 'index', 1538807960, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458705, 'admin', 'index', 'index', 1538807965, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458706, 'admin', 'index', 'get_dev_mappoint', 1538807965, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458707, 'admin', 'index', 'index', 1538807994, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458708, 'admin', 'index', 'get_dev_mappoint', 1538807994, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458709, 'admin', 'account', 'list', 1538808049, 'superadmin', '{\"_url\":\"admin\\/account\\/list\",\"menuid\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (458710, 'admin', 'account', 'list', 1538808050, 'superadmin', '{\"_url\":\"admin\\/account\\/list\",\"menuid\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (458711, 'admin', 'index', 'index', 1538808051, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458712, 'admin', 'index', 'get_dev_mappoint', 1538808051, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458713, 'admin', 'index', 'index', 1538808136, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458714, 'admin', 'index', 'get_dev_mappoint', 1538808136, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458715, 'admin', 'index', 'index', 1538808224, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458716, 'admin', 'index', 'get_dev_mappoint', 1538808224, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458717, 'admin', 'index', 'index', 1538808272, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458718, 'admin', 'index', 'get_dev_mappoint', 1538808273, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458719, 'admin', 'index', 'index', 1538808352, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458720, 'admin', 'index', 'get_dev_mappoint', 1538808352, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458721, 'admin', 'index', 'index', 1538808369, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458722, 'admin', 'index', 'get_dev_mappoint', 1538808369, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458723, 'admin', 'index', 'index', 1538808467, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458724, 'admin', 'index', 'index', 1538808486, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458725, 'admin', 'index', 'index', 1538808506, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458726, 'admin', 'index', 'get_dev_mappoint', 1538808506, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458727, 'admin', 'index', 'index', 1538808524, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458728, 'admin', 'index', 'get_dev_mappoint', 1538808524, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458729, 'admin', 'index', 'newgame', 1538808526, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458730, 'admin', 'index', 'index', 1538808527, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458731, 'admin', 'index', 'get_dev_mappoint', 1538808527, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458732, 'admin', 'account', 'list', 1538808535, 'superadmin', '{\"_url\":\"admin\\/account\\/list\",\"menuid\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (458733, 'admin', 'index', 'index', 1538808539, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458734, 'admin', 'index', 'get_dev_mappoint', 1538808539, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458735, 'admin', 'account', 'list', 1538808540, 'superadmin', '{\"_url\":\"admin\\/account\\/list\",\"menuid\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (458736, 'admin', 'menu', 'list', 1538808545, 'superadmin', '{\"_url\":\"admin\\/menu\\/list\",\"menuid\":\"7\"}');
INSERT INTO `dc_action_logs` VALUES (458737, 'admin', 'menu', 'list', 1538808549, 'superadmin', '{\"_url\":\"admin\\/menu\\/list\",\"menuid\":\"7\"}');
INSERT INTO `dc_action_logs` VALUES (458738, 'admin', 'index', 'index', 1538808550, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458739, 'admin', 'index', 'get_dev_mappoint', 1538808550, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458740, 'admin', 'index', 'index', 1538808611, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458741, 'admin', 'index', 'get_dev_mappoint', 1538808611, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458742, 'admin', 'account', 'list', 1538808612, 'superadmin', '{\"_url\":\"admin\\/account\\/list\",\"menuid\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (458743, 'admin', 'index', 'index', 1538808615, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458744, 'admin', 'index', 'get_dev_mappoint', 1538808615, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458745, 'admin', 'account', 'list', 1538808616, 'superadmin', '{\"_url\":\"admin\\/account\\/list\",\"menuid\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (458746, 'admin', 'account', 'logout', 1538808617, 'superadmin', '{\"_url\":\"admin\\/account\\/logout\",\"tag\":\"\"}');
INSERT INTO `dc_action_logs` VALUES (458747, 'admin', 'account', 'login', 1538808617, NULL, '{\"_url\":\"admin\\/account\\/login\"}');
INSERT INTO `dc_action_logs` VALUES (458748, 'admin', 'account', 'login', 1538808618, NULL, '{\"_url\":\"admin\\/account\\/login\"}');
INSERT INTO `dc_action_logs` VALUES (458749, 'admin', 'account', 'login', 1538808623, NULL, '{\"_url\":\"admin\\/account\\/login\"}');
INSERT INTO `dc_action_logs` VALUES (458750, 'admin', 'index', 'index', 1538808623, 'superadmin', '{\"_url\":\"admin\\/index\\/index\"}');
INSERT INTO `dc_action_logs` VALUES (458751, 'admin', 'index', 'get_dev_mappoint', 1538808624, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458752, 'admin', 'account', 'list', 1538808625, 'superadmin', '{\"_url\":\"admin\\/account\\/list\",\"menuid\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (458753, 'admin', 'index', 'index', 1538808627, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458754, 'admin', 'index', 'get_dev_mappoint', 1538808627, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458755, 'admin', 'index', 'index', 1538808656, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458756, 'admin', 'index', 'get_dev_mappoint', 1538808657, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458757, 'admin', 'system', 'set', 1538808657, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458758, 'admin', 'index', 'index', 1538808659, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458759, 'admin', 'index', 'get_dev_mappoint', 1538808659, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458760, 'admin', 'index', 'index', 1538808660, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458761, 'admin', 'index', 'get_dev_mappoint', 1538808660, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458762, 'admin', 'system', 'set', 1538808694, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458763, 'admin', 'index', 'get_dev_mappoint', 1538808694, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458764, 'admin', 'system', 'set', 1538808878, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458765, 'admin', 'index', 'get_dev_mappoint', 1538808878, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458766, 'admin', 'system', 'set', 1538808911, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458767, 'admin', 'system', 'set', 1538808960, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458768, 'admin', 'system', 'set', 1538808980, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458769, 'admin', 'system', 'set', 1538808990, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458770, 'admin', 'index', 'get_dev_mappoint', 1538808990, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458771, 'admin', 'system', 'set', 1538809036, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458772, 'admin', 'index', 'get_dev_mappoint', 1538809036, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458773, 'admin', 'system', 'set', 1538809044, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458774, 'admin', 'index', 'get_dev_mappoint', 1538809044, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458775, 'admin', 'index', 'index', 1538809242, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458776, 'admin', 'index', 'get_dev_mappoint', 1538809242, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458777, 'admin', 'index', 'index', 1538809368, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458778, 'admin', 'index', 'get_dev_mappoint', 1538809368, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458779, 'admin', 'system', 'set', 1538809370, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458780, 'admin', 'index', 'get_dev_mappoint', 1538809370, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458781, 'admin', 'system', 'update', 1538809374, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (458782, 'admin', 'system', 'update', 1538809409, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (458783, 'admin', 'system', 'set', 1538809601, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458784, 'admin', 'index', 'get_dev_mappoint', 1538809601, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458785, 'admin', 'system', 'update', 1538809604, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (458786, 'admin', 'index', 'index', 1538809605, 'superadmin', '{\"_url\":\"admin\\/index\\/index\"}');
INSERT INTO `dc_action_logs` VALUES (458787, 'admin', 'index', 'get_dev_mappoint', 1538809605, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458788, 'admin', 'system', 'set', 1538809608, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458789, 'admin', 'index', 'get_dev_mappoint', 1538809608, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458790, 'admin', 'system', 'update', 1538809611, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (458791, 'admin', 'index', 'index', 1538809612, 'superadmin', '{\"_url\":\"admin\\/index\\/index\"}');
INSERT INTO `dc_action_logs` VALUES (458792, 'admin', 'index', 'get_dev_mappoint', 1538809612, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458793, 'admin', 'system', 'set', 1538809615, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458794, 'admin', 'index', 'get_dev_mappoint', 1538809615, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458795, 'admin', 'system', 'set', 1538809635, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458796, 'admin', 'index', 'get_dev_mappoint', 1538809636, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458797, 'admin', 'system', 'update', 1538809643, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (458798, 'admin', 'system', 'set', 1538809644, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458799, 'admin', 'index', 'get_dev_mappoint', 1538809644, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458800, 'admin', 'index', 'index', 1538809645, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458801, 'admin', 'index', 'get_dev_mappoint', 1538809645, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458802, 'admin', 'system', 'set', 1538809650, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458803, 'admin', 'index', 'get_dev_mappoint', 1538809650, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458804, 'admin', 'index', 'index', 1538809654, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458805, 'admin', 'index', 'get_dev_mappoint', 1538809654, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458806, 'admin', 'index', 'newgame', 1538809659, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458807, 'admin', 'index', 'newgame', 1538809701, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458808, 'admin', 'index', 'index', 1538809810, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458809, 'admin', 'index', 'get_dev_mappoint', 1538809810, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458810, 'admin', 'system', 'set', 1538809811, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458811, 'admin', 'index', 'get_dev_mappoint', 1538809811, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458812, 'admin', 'system', 'update', 1538809814, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (458813, 'admin', 'system', 'set', 1538809814, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458814, 'admin', 'index', 'get_dev_mappoint', 1538809815, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458815, 'admin', 'index', 'index', 1538809815, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458816, 'admin', 'index', 'get_dev_mappoint', 1538809815, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458817, 'admin', 'index', 'newgame', 1538809817, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458818, 'admin', 'index', 'get_dev_mappoint', 1538809817, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458819, 'admin', 'index', 'newgame', 1538810290, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458820, 'admin', 'index', 'get_dev_mappoint', 1538810291, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458821, 'admin', 'index', 'newgame', 1538810457, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458822, 'admin', 'index', 'get_dev_mappoint', 1538810457, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458823, 'admin', 'index', 'newgame', 1538810495, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458824, 'admin', 'index', 'get_dev_mappoint', 1538810496, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458825, 'admin', 'index', 'newgame', 1538810796, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458826, 'admin', 'index', 'get_dev_mappoint', 1538810796, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458827, 'admin', 'index', 'getname', 1538810797, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458828, 'admin', 'index', 'getname', 1538810815, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458829, 'admin', 'index', 'getname', 1538810862, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458830, 'admin', 'index', 'getname', 1538810875, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458831, 'admin', 'index', 'getname', 1538810879, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458832, 'admin', 'index', 'getname', 1538810880, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458833, 'admin', 'index', 'getname', 1538812569, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458834, 'admin', 'index', 'getname', 1538812571, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458835, 'admin', 'index', 'getname', 1538812576, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458836, 'admin', 'index', 'getname', 1538812577, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458837, 'admin', 'index', 'getname', 1538812580, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458838, 'admin', 'index', 'getname', 1538812583, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458839, 'admin', 'index', 'newgame', 1538814922, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458840, 'admin', 'index', 'get_dev_mappoint', 1538814922, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458841, 'admin', 'index', 'newgame', 1538814940, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458842, 'admin', 'index', 'get_dev_mappoint', 1538814940, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458843, 'admin', 'index', 'getname', 1538814944, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458844, 'admin', 'index', 'getname', 1538814946, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458845, 'admin', 'index', 'getname', 1538814947, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458846, 'admin', 'index', 'getname', 1538814949, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458847, 'admin', 'index', 'getname', 1538814950, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458848, 'admin', 'index', 'getname', 1538814951, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458849, 'admin', 'index', 'newgame', 1538814981, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458850, 'admin', 'index', 'get_dev_mappoint', 1538814981, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458851, 'admin', 'index', 'getname', 1538814982, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458852, 'admin', 'index', 'getname', 1538814984, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458853, 'admin', 'index', 'getname', 1538814984, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458854, 'admin', 'index', 'getname', 1538814985, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458855, 'admin', 'index', 'getname', 1538814986, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458856, 'admin', 'index', 'getname', 1538814987, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458857, 'admin', 'index', 'getname', 1538814992, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458858, 'admin', 'system', 'set', 1538814999, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458859, 'admin', 'index', 'get_dev_mappoint', 1538814999, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458860, 'admin', 'system', 'update', 1538815002, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (458861, 'admin', 'system', 'set', 1538815003, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458862, 'admin', 'index', 'get_dev_mappoint', 1538815003, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458863, 'admin', 'index', 'index', 1538815004, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458864, 'admin', 'index', 'get_dev_mappoint', 1538815004, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458865, 'admin', 'index', 'newgame', 1538815005, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458866, 'admin', 'index', 'get_dev_mappoint', 1538815006, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458867, 'admin', 'index', 'getname', 1538815007, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458868, 'admin', 'index', 'getname', 1538815008, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458869, 'admin', 'index', 'getname', 1538815009, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458870, 'admin', 'index', 'getname', 1538815010, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458871, 'admin', 'index', 'getname', 1538815010, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458872, 'admin', 'index', 'getname', 1538815012, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458873, 'admin', 'index', 'getname', 1538815013, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458874, 'admin', 'index', 'getname', 1538815014, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458875, 'admin', 'index', 'getname', 1538815015, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458876, 'admin', 'index', 'newgame', 1538815938, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458877, 'admin', 'index', 'newgame', 1538815961, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458878, 'admin', 'index', 'get_dev_mappoint', 1538815961, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458879, 'admin', 'index', 'getname', 1538815963, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458880, 'admin', 'index', 'newgame', 1538816047, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458881, 'admin', 'index', 'get_dev_mappoint', 1538816047, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458882, 'admin', 'index', 'getname', 1538816049, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458883, 'admin', 'index', 'newgame', 1538816121, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458884, 'admin', 'index', 'get_dev_mappoint', 1538816122, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458885, 'admin', 'index', 'getname', 1538816123, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458886, 'admin', 'index', 'newgame', 1538816144, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458887, 'admin', 'index', 'get_dev_mappoint', 1538816144, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458888, 'admin', 'index', 'getname', 1538816148, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458889, 'admin', 'index', 'newgame', 1538816208, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458890, 'admin', 'index', 'get_dev_mappoint', 1538816209, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458891, 'admin', 'index', 'getname', 1538816210, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458892, 'admin', 'index', 'getname', 1538816236, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458893, 'admin', 'index', 'getname', 1538816236, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458894, 'admin', 'index', 'getname', 1538816238, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458895, 'admin', 'index', 'getname', 1538816238, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458896, 'admin', 'index', 'getname', 1538816239, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458897, 'admin', 'index', 'getname', 1538816240, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458898, 'admin', 'index', 'getname', 1538816240, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458899, 'admin', 'index', 'newgame', 1538816907, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458900, 'admin', 'index', 'get_dev_mappoint', 1538816908, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458901, 'admin', 'index', 'getname', 1538816914, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458902, 'admin', 'index', 'getname', 1538816915, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458903, 'admin', 'index', 'getname', 1538816915, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458904, 'admin', 'index', 'getname', 1538816916, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458905, 'admin', 'index', 'getname', 1538816917, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458906, 'admin', 'index', 'getname', 1538816917, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458907, 'admin', 'index', 'getname', 1538816918, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458908, 'admin', 'index', 'getname', 1538816919, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458909, 'admin', 'index', 'newgame', 1538816946, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458910, 'admin', 'index', 'get_dev_mappoint', 1538816946, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458911, 'admin', 'index', 'getname', 1538816947, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458912, 'admin', 'index', 'getname', 1538816947, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458913, 'admin', 'index', 'getname', 1538816948, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458914, 'admin', 'index', 'getname', 1538816949, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458915, 'admin', 'index', 'getname', 1538816949, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458916, 'admin', 'index', 'getname', 1538816950, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458917, 'admin', 'index', 'getname', 1538816950, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458918, 'admin', 'index', 'getname', 1538816951, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458919, 'admin', 'index', 'newgame', 1538817412, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458920, 'admin', 'index', 'get_dev_mappoint', 1538817412, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458921, 'admin', 'index', 'getname', 1538817414, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458922, 'admin', 'index', 'getname', 1538817415, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458923, 'admin', 'index', 'getname', 1538817416, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458924, 'admin', 'index', 'getname', 1538817426, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458925, 'admin', 'index', 'getname', 1538817427, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458926, 'admin', 'index', 'getname', 1538817428, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458927, 'admin', 'index', 'getname', 1538817429, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458928, 'admin', 'index', 'getname', 1538817430, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458929, 'admin', 'index', 'getname', 1538817431, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458930, 'admin', 'index', 'getname', 1538817434, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458931, 'admin', 'index', 'getname', 1538817441, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458932, 'admin', 'index', 'newgame', 1538817474, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458933, 'admin', 'index', 'get_dev_mappoint', 1538817475, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458934, 'admin', 'index', 'getname', 1538817476, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458935, 'admin', 'index', 'getname', 1538817476, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458936, 'admin', 'index', 'getname', 1538817477, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458937, 'admin', 'index', 'getname', 1538817477, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458938, 'admin', 'index', 'getname', 1538817478, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458939, 'admin', 'system', 'set', 1538817480, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458940, 'admin', 'index', 'get_dev_mappoint', 1538817480, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458941, 'admin', 'system', 'update', 1538817484, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (458942, 'admin', 'system', 'set', 1538817484, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (458943, 'admin', 'index', 'get_dev_mappoint', 1538817484, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458944, 'admin', 'index', 'index', 1538817485, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (458945, 'admin', 'index', 'get_dev_mappoint', 1538817485, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458946, 'admin', 'index', 'newgame', 1538817486, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458947, 'admin', 'index', 'get_dev_mappoint', 1538817486, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458948, 'admin', 'index', 'getname', 1538817488, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458949, 'admin', 'index', 'getname', 1538817489, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458950, 'admin', 'index', 'getname', 1538817490, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458951, 'admin', 'index', 'newgame', 1538817560, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458952, 'admin', 'index', 'get_dev_mappoint', 1538817560, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458953, 'admin', 'index', 'getname', 1538817561, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458954, 'admin', 'index', 'getname', 1538817562, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458955, 'admin', 'index', 'getname', 1538817563, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458956, 'admin', 'index', 'getname', 1538817564, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458957, 'admin', 'index', 'getname', 1538817565, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458958, 'admin', 'index', 'getname', 1538817577, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458959, 'admin', 'index', 'newgame', 1538817632, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458960, 'admin', 'index', 'get_dev_mappoint', 1538817633, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458961, 'admin', 'index', 'getname', 1538817634, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458962, 'admin', 'index', 'getname', 1538817635, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458963, 'admin', 'index', 'getname', 1538817635, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458964, 'admin', 'index', 'newgame', 1538817665, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458965, 'admin', 'index', 'get_dev_mappoint', 1538817666, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458966, 'admin', 'index', 'getname', 1538817666, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458967, 'admin', 'index', 'getname', 1538817667, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458968, 'admin', 'index', 'getname', 1538817668, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458969, 'admin', 'index', 'newgame', 1538817693, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458970, 'admin', 'index', 'get_dev_mappoint', 1538817694, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458971, 'admin', 'index', 'getname', 1538817695, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458972, 'admin', 'index', 'getname', 1538817695, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458973, 'admin', 'index', 'getname', 1538817696, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458974, 'admin', 'index', 'newgame', 1538817765, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458975, 'admin', 'index', 'get_dev_mappoint', 1538817765, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458976, 'admin', 'index', 'getname', 1538817767, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458977, 'admin', 'index', 'getname', 1538817767, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458978, 'admin', 'index', 'getname', 1538817769, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458979, 'admin', 'index', 'newgame', 1538817795, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458980, 'admin', 'index', 'get_dev_mappoint', 1538817795, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458981, 'admin', 'index', 'getname', 1538817796, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458982, 'admin', 'index', 'getname', 1538817797, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458983, 'admin', 'index', 'getname', 1538817797, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458984, 'admin', 'index', 'newgame', 1538817848, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458985, 'admin', 'index', 'get_dev_mappoint', 1538817848, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458986, 'admin', 'index', 'getname', 1538817849, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458987, 'admin', 'index', 'getname', 1538817850, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458988, 'admin', 'index', 'getname', 1538817850, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458989, 'admin', 'index', 'newgame', 1538817904, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458990, 'admin', 'index', 'get_dev_mappoint', 1538817904, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458991, 'admin', 'index', 'getname', 1538817905, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458992, 'admin', 'index', 'getname', 1538817906, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458993, 'admin', 'index', 'getname', 1538817907, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458994, 'admin', 'index', 'getname', 1538817909, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458995, 'admin', 'index', 'newgame', 1538817928, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (458996, 'admin', 'index', 'get_dev_mappoint', 1538817928, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (458997, 'admin', 'index', 'getname', 1538817929, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458998, 'admin', 'index', 'getname', 1538817929, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (458999, 'admin', 'index', 'newgame', 1538817976, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459000, 'admin', 'index', 'get_dev_mappoint', 1538817976, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459001, 'admin', 'index', 'getname', 1538817977, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459002, 'admin', 'index', 'getname', 1538817977, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459003, 'admin', 'index', 'getname', 1538817978, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459004, 'admin', 'index', 'getname', 1538817984, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459005, 'admin', 'index', 'getname', 1538817984, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459006, 'admin', 'index', 'getname', 1538817988, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459007, 'admin', 'index', 'getname', 1538817992, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459008, 'admin', 'index', 'newgame', 1538818053, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459009, 'admin', 'index', 'get_dev_mappoint', 1538818054, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459010, 'admin', 'index', 'getname', 1538818055, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459011, 'admin', 'index', 'getname', 1538818056, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459012, 'admin', 'index', 'getname', 1538818056, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459013, 'admin', 'index', 'getname', 1538818063, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459014, 'admin', 'index', 'getname', 1538818067, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459015, 'admin', 'index', 'getname', 1538818088, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459016, 'admin', 'index', 'getname', 1538818125, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459017, 'admin', 'index', 'getname', 1538818144, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459018, 'admin', 'index', 'newgame', 1538818213, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459019, 'admin', 'index', 'get_dev_mappoint', 1538818213, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459020, 'admin', 'index', 'getname', 1538818217, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459021, 'admin', 'index', 'getname', 1538818217, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459022, 'admin', 'index', 'getname', 1538818218, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459023, 'admin', 'index', 'getname', 1538818227, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459024, 'admin', 'index', 'getname', 1538818243, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459025, 'admin', 'index', 'getname', 1538818245, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459026, 'admin', 'index', 'getname', 1538818263, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459027, 'admin', 'index', 'getname', 1538818270, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459028, 'admin', 'index', 'newgame', 1538818362, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459029, 'admin', 'index', 'get_dev_mappoint', 1538818362, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459030, 'admin', 'index', 'getname', 1538818363, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459031, 'admin', 'index', 'getname', 1538818364, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459032, 'admin', 'index', 'getname', 1538818365, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459033, 'admin', 'index', 'getname', 1538818371, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459034, 'admin', 'index', 'getname', 1538818378, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459035, 'admin', 'index', 'newgame', 1538818414, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459036, 'admin', 'index', 'get_dev_mappoint', 1538818414, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459037, 'admin', 'index', 'getname', 1538818416, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459038, 'admin', 'index', 'getname', 1538818419, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459039, 'admin', 'index', 'newgame', 1538818440, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459040, 'admin', 'index', 'get_dev_mappoint', 1538818440, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459041, 'admin', 'index', 'getname', 1538818442, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459042, 'admin', 'index', 'getname', 1538818443, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459043, 'admin', 'index', 'getname', 1538818444, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459044, 'admin', 'index', 'getname', 1538818446, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459045, 'admin', 'index', 'getname', 1538818450, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459046, 'admin', 'index', 'getname', 1538818462, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459047, 'admin', 'index', 'getname', 1538818470, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459048, 'admin', 'index', 'getname', 1538818473, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459049, 'admin', 'index', 'getname', 1538818475, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459050, 'admin', 'index', 'index', 1538818538, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459051, 'admin', 'index', 'get_dev_mappoint', 1538818538, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459052, 'admin', 'index', 'newgame', 1538818539, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459053, 'admin', 'index', 'get_dev_mappoint', 1538818540, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459054, 'admin', 'index', 'getname', 1538818541, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459055, 'admin', 'index', 'getname', 1538818542, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459056, 'admin', 'index', 'getname', 1538818542, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459057, 'admin', 'index', 'getname', 1538818559, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459058, 'admin', 'index', 'newgame', 1538818606, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459059, 'admin', 'index', 'get_dev_mappoint', 1538818606, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459060, 'admin', 'index', 'getname', 1538818607, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459061, 'admin', 'index', 'getname', 1538818608, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459062, 'admin', 'index', 'getname', 1538818609, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459063, 'admin', 'index', 'getname', 1538818616, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459064, 'admin', 'system', 'set', 1538818643, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459065, 'admin', 'index', 'get_dev_mappoint', 1538818644, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459066, 'admin', 'index', 'index', 1538818650, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459067, 'admin', 'index', 'get_dev_mappoint', 1538818650, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459068, 'admin', 'index', 'newgame', 1538818651, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459069, 'admin', 'index', 'get_dev_mappoint', 1538818651, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459070, 'admin', 'index', 'getname', 1538818652, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459071, 'admin', 'index', 'getname', 1538818653, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459072, 'admin', 'index', 'getname', 1538818653, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459073, 'admin', 'index', 'getname', 1538818662, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459074, 'admin', 'index', 'getname', 1538818680, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459075, 'admin', 'index', 'getname', 1538818688, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459076, 'admin', 'index', 'getname', 1538818749, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459077, 'admin', 'index', 'newgame', 1538818778, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459078, 'admin', 'index', 'get_dev_mappoint', 1538818778, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459079, 'admin', 'index', 'getname', 1538818780, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459080, 'admin', 'index', 'getname', 1538818781, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459081, 'admin', 'index', 'getname', 1538818782, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459082, 'admin', 'index', 'getname', 1538818788, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459083, 'admin', 'index', 'getname', 1538818793, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459084, 'admin', 'index', 'getname', 1538818826, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459085, 'admin', 'index', 'getname', 1538818831, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459086, 'admin', 'system', 'set', 1538818849, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459087, 'admin', 'index', 'get_dev_mappoint', 1538818849, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459088, 'admin', 'system', 'update', 1538818861, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459089, 'admin', 'system', 'set', 1538818862, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459090, 'admin', 'index', 'get_dev_mappoint', 1538818862, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459091, 'admin', 'index', 'index', 1538818863, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459092, 'admin', 'index', 'get_dev_mappoint', 1538818864, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459093, 'admin', 'index', 'newgame', 1538818865, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459094, 'admin', 'index', 'get_dev_mappoint', 1538818865, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459095, 'admin', 'index', 'getname', 1538818870, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459096, 'admin', 'index', 'getname', 1538818870, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459097, 'admin', 'index', 'getname', 1538818871, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459098, 'admin', 'index', 'getname', 1538818872, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459099, 'admin', 'index', 'getname', 1538818877, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459100, 'admin', 'index', 'getname', 1538818882, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459101, 'admin', 'index', 'getname', 1538818891, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459102, 'admin', 'index', 'getname', 1538818905, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459103, 'admin', 'index', 'getname', 1538818956, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459104, 'admin', 'system', 'set', 1538818976, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459105, 'admin', 'index', 'get_dev_mappoint', 1538818976, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459106, 'admin', 'index', 'index', 1538818977, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459107, 'admin', 'index', 'get_dev_mappoint', 1538818978, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459108, 'admin', 'index', 'newgame', 1538818983, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459109, 'admin', 'index', 'get_dev_mappoint', 1538818984, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459110, 'admin', 'system', 'set', 1538818986, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459111, 'admin', 'index', 'get_dev_mappoint', 1538818986, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459112, 'admin', 'system', 'update', 1538819030, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459113, 'admin', 'system', 'set', 1538819031, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459114, 'admin', 'index', 'get_dev_mappoint', 1538819031, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459115, 'admin', 'index', 'index', 1538819039, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459116, 'admin', 'index', 'get_dev_mappoint', 1538819039, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459117, 'admin', 'index', 'newgame', 1538819042, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459118, 'admin', 'index', 'get_dev_mappoint', 1538819042, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459119, 'admin', 'index', 'getname', 1538819053, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459120, 'admin', 'index', 'getname', 1538819056, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459121, 'admin', 'index', 'getname', 1538819058, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459122, 'admin', 'index', 'getname', 1538819062, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459123, 'admin', 'index', 'getname', 1538819065, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459124, 'admin', 'index', 'getname', 1538819069, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459125, 'admin', 'index', 'getname', 1538819072, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459126, 'admin', 'index', 'getname', 1538819074, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459127, 'admin', 'index', 'getname', 1538819077, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459128, 'admin', 'index', 'getname', 1538819081, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459129, 'admin', 'index', 'getname', 1538819084, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459130, 'admin', 'index', 'index', 1538819115, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459131, 'admin', 'index', 'get_dev_mappoint', 1538819115, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459132, 'admin', 'system', 'set', 1538819119, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459133, 'admin', 'index', 'get_dev_mappoint', 1538819119, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459134, 'admin', 'system', 'update', 1538819134, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459135, 'admin', 'system', 'set', 1538819134, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459136, 'admin', 'index', 'get_dev_mappoint', 1538819135, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459137, 'admin', 'system', 'update', 1538819188, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459138, 'admin', 'system', 'set', 1538819188, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459139, 'admin', 'index', 'get_dev_mappoint', 1538819189, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459140, 'admin', 'index', 'index', 1538819190, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459141, 'admin', 'index', 'get_dev_mappoint', 1538819191, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459142, 'admin', 'index', 'newgame', 1538819196, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459143, 'admin', 'index', 'get_dev_mappoint', 1538819197, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459144, 'admin', 'index', 'getname', 1538819234, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459145, 'admin', 'index', 'getname', 1538819242, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459146, 'admin', 'system', 'set', 1538819244, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459147, 'admin', 'index', 'get_dev_mappoint', 1538819244, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459148, 'admin', 'system', 'update', 1538819247, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459149, 'admin', 'system', 'set', 1538819247, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459150, 'admin', 'index', 'get_dev_mappoint', 1538819247, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459151, 'admin', 'index', 'index', 1538819249, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459152, 'admin', 'index', 'get_dev_mappoint', 1538819249, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459153, 'admin', 'index', 'newgame', 1538819252, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459154, 'admin', 'index', 'get_dev_mappoint', 1538819252, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459155, 'admin', 'index', 'getname', 1538819258, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459156, 'admin', 'index', 'index', 1538819273, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459157, 'admin', 'index', 'get_dev_mappoint', 1538819274, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459158, 'admin', 'index', 'newgame', 1538819275, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459159, 'admin', 'index', 'get_dev_mappoint', 1538819275, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459160, 'admin', 'index', 'getname', 1538819282, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459161, 'admin', 'system', 'set', 1538819393, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459162, 'admin', 'index', 'get_dev_mappoint', 1538819393, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459163, 'admin', 'system', 'update', 1538819424, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459164, 'admin', 'system', 'set', 1538819425, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459165, 'admin', 'index', 'get_dev_mappoint', 1538819425, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459166, 'admin', 'index', 'index', 1538819459, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459167, 'admin', 'index', 'get_dev_mappoint', 1538819459, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459168, 'admin', 'index', 'newgame', 1538819476, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459169, 'admin', 'index', 'get_dev_mappoint', 1538819476, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459170, 'admin', 'index', 'index', 1538819479, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459171, 'admin', 'index', 'get_dev_mappoint', 1538819479, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459172, 'admin', 'system', 'set', 1538819482, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459173, 'admin', 'index', 'get_dev_mappoint', 1538819482, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459174, 'admin', 'system', 'update', 1538819484, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459175, 'admin', 'system', 'set', 1538819484, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459176, 'admin', 'index', 'get_dev_mappoint', 1538819484, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459177, 'admin', 'index', 'index', 1538819487, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459178, 'admin', 'index', 'get_dev_mappoint', 1538819487, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459179, 'admin', 'system', 'set', 1538819495, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459180, 'admin', 'index', 'get_dev_mappoint', 1538819495, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459181, 'admin', 'system', 'update', 1538819501, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459182, 'admin', 'system', 'set', 1538819501, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459183, 'admin', 'index', 'get_dev_mappoint', 1538819501, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459184, 'admin', 'index', 'index', 1538819502, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459185, 'admin', 'index', 'get_dev_mappoint', 1538819503, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459186, 'admin', 'system', 'set', 1538819509, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459187, 'admin', 'index', 'get_dev_mappoint', 1538819509, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459188, 'admin', 'system', 'update', 1538819512, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459189, 'admin', 'system', 'set', 1538819512, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459190, 'admin', 'index', 'get_dev_mappoint', 1538819513, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459191, 'admin', 'index', 'index', 1538819514, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459192, 'admin', 'index', 'get_dev_mappoint', 1538819514, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459193, 'admin', 'index', 'newgame', 1538819517, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459194, 'admin', 'index', 'get_dev_mappoint', 1538819517, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459195, 'admin', 'index', 'getname', 1538819524, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459196, 'admin', 'index', 'getname', 1538819586, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459197, 'admin', 'index', 'getname', 1538819654, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459198, 'admin', 'index', 'getname', 1538819680, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459199, 'admin', 'index', 'newgame', 1538819701, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459200, 'admin', 'index', 'get_dev_mappoint', 1538819702, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459201, 'admin', 'index', 'getname', 1538819703, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459202, 'admin', 'index', 'getname', 1538819710, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459203, 'admin', 'index', 'newgame', 1538819760, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459204, 'admin', 'index', 'get_dev_mappoint', 1538819761, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459205, 'admin', 'index', 'newgame', 1538819767, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459206, 'admin', 'index', 'get_dev_mappoint', 1538819767, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459207, 'admin', 'index', 'getname', 1538819768, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459208, 'admin', 'index', 'getname', 1538819770, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459209, 'admin', 'index', 'getname', 1538819771, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459210, 'admin', 'index', 'getname', 1538819772, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459211, 'admin', 'index', 'getname', 1538819774, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459212, 'admin', 'index', 'getname', 1538819777, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459213, 'admin', 'system', 'set', 1538819784, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459214, 'admin', 'index', 'get_dev_mappoint', 1538819785, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459215, 'admin', 'system', 'update', 1538819788, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459216, 'admin', 'system', 'set', 1538819788, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459217, 'admin', 'index', 'get_dev_mappoint', 1538819789, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459218, 'admin', 'index', 'index', 1538819789, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459219, 'admin', 'index', 'get_dev_mappoint', 1538819789, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459220, 'admin', 'index', 'newgame', 1538819791, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459221, 'admin', 'index', 'get_dev_mappoint', 1538819791, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459222, 'admin', 'index', 'getname', 1538819794, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459223, 'admin', 'index', 'getname', 1538819795, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459224, 'admin', 'index', 'getname', 1538819820, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459225, 'admin', 'index', 'getname', 1538819822, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459226, 'admin', 'index', 'getname', 1538819832, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459227, 'admin', 'index', 'newgame', 1538821487, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459228, 'admin', 'index', 'get_dev_mappoint', 1538821487, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459229, 'admin', 'index', 'getname', 1538821488, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459230, 'admin', 'index', 'getname', 1538821489, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459231, 'admin', 'index', 'savegame', 1538821500, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459232, 'admin', 'index', 'newgame', 1538821558, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459233, 'admin', 'index', 'get_dev_mappoint', 1538821558, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459234, 'admin', 'index', 'getname', 1538821559, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459235, 'admin', 'index', 'getname', 1538821560, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459236, 'admin', 'index', 'savegame', 1538821568, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459237, 'admin', 'index', 'newgame', 1538821596, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459238, 'admin', 'index', 'get_dev_mappoint', 1538821596, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459239, 'admin', 'index', 'getname', 1538821598, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459240, 'admin', 'index', 'getname', 1538821600, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459241, 'admin', 'index', 'savegame', 1538821610, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459242, 'admin', 'index', 'savegame', 1538821617, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459243, 'admin', 'index', 'savegame', 1538821741, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459244, 'admin', 'index', 'savegame', 1538821757, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459245, 'admin', 'index', 'index', 1538821758, 'superadmin', '{\"_url\":\"admin\\/index\\/index\"}');
INSERT INTO `dc_action_logs` VALUES (459246, 'admin', 'index', 'get_dev_mappoint', 1538821758, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459247, 'admin', 'system', 'set', 1538821869, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459248, 'admin', 'index', 'get_dev_mappoint', 1538821869, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459249, 'admin', 'system', 'update', 1538821872, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459250, 'admin', 'system', 'set', 1538821873, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459251, 'admin', 'index', 'get_dev_mappoint', 1538821873, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459252, 'admin', 'index', 'index', 1538821875, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459253, 'admin', 'index', 'get_dev_mappoint', 1538821876, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459254, 'admin', 'index', 'newgame', 1538821877, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459255, 'admin', 'index', 'get_dev_mappoint', 1538821877, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459256, 'admin', 'index', 'getname', 1538821879, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459257, 'admin', 'index', 'getname', 1538821879, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459258, 'admin', 'index', 'getname', 1538821880, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459259, 'admin', 'index', 'getname', 1538821881, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459260, 'admin', 'index', 'savegame', 1538821892, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459261, 'admin', 'index', 'index', 1538821893, 'superadmin', '{\"_url\":\"admin\\/index\\/index\"}');
INSERT INTO `dc_action_logs` VALUES (459262, 'admin', 'index', 'get_dev_mappoint', 1538821893, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459263, 'admin', 'index', 'newgame', 1538821925, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459264, 'admin', 'index', 'get_dev_mappoint', 1538821926, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459265, 'admin', 'system', 'set', 1538821932, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459266, 'admin', 'index', 'get_dev_mappoint', 1538821932, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459267, 'admin', 'index', 'index', 1538821933, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459268, 'admin', 'index', 'get_dev_mappoint', 1538821933, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459269, 'admin', 'system', 'set', 1538821942, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459270, 'admin', 'index', 'get_dev_mappoint', 1538821942, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459271, 'admin', 'index', 'index', 1538821943, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459272, 'admin', 'index', 'get_dev_mappoint', 1538821943, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459273, 'admin', 'index', 'newgame', 1538822290, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459274, 'admin', 'index', 'get_dev_mappoint', 1538822290, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459275, 'admin', 'index', 'index', 1538822294, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459276, 'admin', 'index', 'get_dev_mappoint', 1538822294, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459277, 'admin', 'system', 'set', 1538822295, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459278, 'admin', 'index', 'get_dev_mappoint', 1538822295, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459279, 'admin', 'index', 'index', 1538822299, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459280, 'admin', 'index', 'get_dev_mappoint', 1538822299, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459281, 'admin', 'index', 'index', 1538822334, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459282, 'admin', 'index', 'get_dev_mappoint', 1538822335, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459283, 'admin', 'index', 'index', 1538822335, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459284, 'admin', 'index', 'get_dev_mappoint', 1538822336, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459285, 'admin', 'index', 'index', 1538822742, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459286, 'admin', 'index', 'get_dev_mappoint', 1538822742, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459287, 'admin', 'index', 'gamedetail', 1538822744, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459288, 'admin', 'index', 'index', 1538822757, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459289, 'admin', 'index', 'get_dev_mappoint', 1538822758, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459290, 'admin', 'index', 'gamedetail', 1538822759, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459291, 'admin', 'index', 'index', 1538822760, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459292, 'admin', 'index', 'get_dev_mappoint', 1538822760, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459293, 'admin', 'index', 'gamedetail', 1538822761, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459294, 'admin', 'index', 'gamedetail', 1538822862, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459295, 'admin', 'index', 'gamedetail', 1538823039, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459296, 'admin', 'index', 'gamedetail', 1538823128, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459297, 'admin', 'index', 'gamedetail', 1538823129, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459298, 'admin', 'index', 'gamedetail', 1538823130, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459299, 'admin', 'index', 'gamedetail', 1538823145, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459300, 'admin', 'index', 'gamedetail', 1538823159, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459301, 'admin', 'index', 'gamedetail', 1538824311, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459302, 'admin', 'index', 'gamedetail', 1538824325, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459303, 'admin', 'index', 'gamedetail', 1538824338, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459304, 'admin', 'index', 'gamedetail', 1538824362, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459305, 'admin', 'index', 'gamedetail', 1538824391, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459306, 'admin', 'index', 'gamedetail', 1538824405, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459307, 'admin', 'index', 'gamedetail', 1538824448, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459308, 'admin', 'index', 'gamedetail', 1538824467, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459309, 'admin', 'index', 'gamedetail', 1538824478, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459310, 'admin', 'index', 'gamedetail', 1538824530, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459311, 'admin', 'index', 'gamedetail', 1538824585, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459312, 'admin', 'index', 'gamedetail', 1538824655, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459313, 'admin', 'index', 'gamedetail', 1538824780, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459314, 'admin', 'index', 'gamedetail', 1538824790, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459315, 'admin', 'index', 'gamedetail', 1538824883, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459316, 'admin', 'index', 'get_dev_mappoint', 1538824883, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459317, 'admin', 'index', 'gamedetail', 1538824921, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459318, 'admin', 'index', 'gamedetail', 1538824953, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459319, 'admin', 'index', 'get_dev_mappoint', 1538824953, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459320, 'admin', 'index', 'gamedetail', 1538824965, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459321, 'admin', 'index', 'get_dev_mappoint', 1538824965, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459322, 'admin', 'index', 'gamedetail', 1538824976, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459323, 'admin', 'index', 'get_dev_mappoint', 1538824976, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459324, 'admin', 'index', 'gamedetail', 1538824991, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459325, 'admin', 'index', 'get_dev_mappoint', 1538824991, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459326, 'admin', 'index', 'gamedetail', 1538824997, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459327, 'admin', 'index', 'get_dev_mappoint', 1538824997, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459328, 'admin', 'index', 'index', 1538825050, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459329, 'admin', 'index', 'get_dev_mappoint', 1538825051, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459330, 'admin', 'system', 'set', 1538825053, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459331, 'admin', 'index', 'get_dev_mappoint', 1538825053, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459332, 'admin', 'index', 'index', 1538825054, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459333, 'admin', 'index', 'get_dev_mappoint', 1538825055, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459334, 'admin', 'index', 'gamedetail', 1538825056, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459335, 'admin', 'index', 'get_dev_mappoint', 1538825056, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459336, 'admin', 'index', 'userdetail', 1538833631, 'superadmin', '{\"_url\":\"admin\\/index\\/userdetail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459337, 'admin', 'index', 'gamedetail', 1538833633, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459338, 'admin', 'index', 'get_dev_mappoint', 1538833633, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459339, 'admin', 'index', 'index', 1538833640, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459340, 'admin', 'index', 'get_dev_mappoint', 1538833640, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459341, 'admin', 'system', 'set', 1538833642, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459342, 'admin', 'index', 'get_dev_mappoint', 1538833642, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459343, 'admin', 'index', 'index', 1538833643, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459344, 'admin', 'index', 'get_dev_mappoint', 1538833643, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459345, 'admin', 'index', 'gamedetail', 1538833655, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459346, 'admin', 'index', 'get_dev_mappoint', 1538833655, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459347, 'admin', 'index', 'gamedetail', 1538833660, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459348, 'admin', 'index', 'get_dev_mappoint', 1538833660, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459349, 'admin', 'player', 'list', 1538833703, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459350, 'admin', 'player', 'list', 1538833767, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459351, 'admin', 'player', 'detail', 1538833768, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459352, 'admin', 'index', 'gamedetail', 1538833769, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459353, 'admin', 'index', 'get_dev_mappoint', 1538833769, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459354, 'admin', 'index', 'index', 1538833770, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459355, 'admin', 'index', 'get_dev_mappoint', 1538833770, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459356, 'admin', 'player', 'list', 1538833771, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"menuid\":\"14\"}');
INSERT INTO `dc_action_logs` VALUES (459357, 'admin', 'index', 'index', 1538833772, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459358, 'admin', 'index', 'get_dev_mappoint', 1538833772, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459359, 'admin', 'system', 'set', 1538833772, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459360, 'admin', 'index', 'get_dev_mappoint', 1538833773, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459361, 'admin', 'player', 'list', 1538833773, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"menuid\":\"14\"}');
INSERT INTO `dc_action_logs` VALUES (459362, 'admin', 'system', 'set', 1538833774, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459363, 'admin', 'index', 'get_dev_mappoint', 1538833775, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459364, 'admin', 'index', 'index', 1538833776, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459365, 'admin', 'index', 'get_dev_mappoint', 1538833776, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459366, 'admin', 'index', 'gamedetail', 1538833778, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459367, 'admin', 'index', 'get_dev_mappoint', 1538833779, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459368, 'admin', 'player', 'detail', 1538834006, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459369, 'admin', 'player', 'list', 1538834011, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459370, 'admin', 'player', 'list', 1538834030, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459371, 'admin', 'player', 'list', 1538834073, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459372, 'admin', 'player', 'list', 1538834128, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459373, 'admin', 'player', 'list', 1538834166, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459374, 'admin', 'player', 'list', 1538834199, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459375, 'admin', 'index', 'get_dev_mappoint', 1538834199, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459376, 'admin', 'player', 'list', 1538834213, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459377, 'admin', 'index', 'get_dev_mappoint', 1538834213, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459378, 'admin', 'player', 'list', 1538834704, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459379, 'admin', 'index', 'get_dev_mappoint', 1538834704, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459380, 'admin', 'player', 'list', 1538834810, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459381, 'admin', 'index', 'get_dev_mappoint', 1538834810, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459382, 'admin', 'index', 'index', 1538834811, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"\"}');
INSERT INTO `dc_action_logs` VALUES (459383, 'admin', 'index', 'get_dev_mappoint', 1538834812, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459384, 'admin', 'index', 'index', 1538834846, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"\"}');
INSERT INTO `dc_action_logs` VALUES (459385, 'admin', 'index', 'get_dev_mappoint', 1538834847, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459386, 'admin', 'player', 'list', 1538834847, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459387, 'admin', 'index', 'get_dev_mappoint', 1538834848, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459388, 'admin', 'player', 'list', 1538834848, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459389, 'admin', 'index', 'get_dev_mappoint', 1538834849, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459390, 'admin', 'index', 'index', 1538834850, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"\",\"_url\":\"index.php?_url=admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459391, 'admin', 'index', 'get_dev_mappoint', 1538834850, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459392, 'admin', 'index', 'index', 1538834868, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"\",\"_url\":\"index.php?_url=admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459393, 'admin', 'index', 'get_dev_mappoint', 1538834868, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459394, 'admin', 'player', 'list', 1538834870, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"6\"}');
INSERT INTO `dc_action_logs` VALUES (459395, 'admin', 'index', 'get_dev_mappoint', 1538834870, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459396, 'admin', 'player', 'list', 1538834872, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"\",\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459397, 'admin', 'index', 'get_dev_mappoint', 1538834872, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459398, 'admin', 'player', 'list', 1538834881, 'superadmin', '{\"keyname\":\"1\",\"min\":\"\",\"max\":\"\",\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459399, 'admin', 'index', 'get_dev_mappoint', 1538834882, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459400, 'admin', 'player', 'list', 1538834889, 'superadmin', '{\"keyname\":\"\",\"min\":\"20\",\"max\":\"\",\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459401, 'admin', 'index', 'get_dev_mappoint', 1538834889, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459402, 'admin', 'player', 'list', 1538834894, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"20\",\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459403, 'admin', 'index', 'get_dev_mappoint', 1538834895, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459404, 'admin', 'player', 'list', 1538834956, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"20\",\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459405, 'admin', 'index', 'get_dev_mappoint', 1538834956, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459406, 'admin', 'player', 'list', 1538834958, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"20\",\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459407, 'admin', 'index', 'get_dev_mappoint', 1538834958, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459408, 'admin', 'player', 'list', 1538834961, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"20\",\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459409, 'admin', 'index', 'get_dev_mappoint', 1538834961, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459410, 'admin', 'player', 'list', 1538834970, 'superadmin', '{\"keyname\":\"\",\"min\":\"20\",\"max\":\"\",\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459411, 'admin', 'index', 'get_dev_mappoint', 1538834970, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459412, 'admin', 'player', 'list', 1538834976, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"20\",\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459413, 'admin', 'index', 'get_dev_mappoint', 1538834976, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459414, 'admin', 'player', 'list', 1538834982, 'superadmin', '{\"keyname\":\"2\",\"min\":\"\",\"max\":\"\",\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459415, 'admin', 'index', 'get_dev_mappoint', 1538834983, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459416, 'admin', 'player', 'list', 1538835036, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"\",\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459417, 'admin', 'index', 'get_dev_mappoint', 1538835036, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459418, 'admin', 'index', 'index', 1538835051, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459419, 'admin', 'index', 'get_dev_mappoint', 1538835051, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459420, 'admin', 'index', 'gamedetail', 1538835052, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459421, 'admin', 'index', 'get_dev_mappoint', 1538835053, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459422, 'admin', 'index', 'index', 1538835054, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459423, 'admin', 'index', 'get_dev_mappoint', 1538835054, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459424, 'admin', 'index', 'newgame', 1538835055, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459425, 'admin', 'index', 'get_dev_mappoint', 1538835055, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459426, 'admin', 'index', 'getname', 1538835057, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459427, 'admin', 'index', 'getname', 1538835058, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459428, 'admin', 'index', 'getname', 1538835058, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459429, 'admin', 'index', 'getname', 1538835059, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459430, 'admin', 'index', 'savegame', 1538835081, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459431, 'admin', 'index', 'index', 1538835082, 'superadmin', '{\"_url\":\"admin\\/index\\/index\"}');
INSERT INTO `dc_action_logs` VALUES (459432, 'admin', 'index', 'get_dev_mappoint', 1538835082, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459433, 'admin', 'index', 'gamedetail', 1538835085, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"4\"}');
INSERT INTO `dc_action_logs` VALUES (459434, 'admin', 'index', 'get_dev_mappoint', 1538835085, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459435, 'admin', 'player', 'detail', 1538835092, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459436, 'admin', 'index', 'gamedetail', 1538835093, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"4\"}');
INSERT INTO `dc_action_logs` VALUES (459437, 'admin', 'index', 'get_dev_mappoint', 1538835093, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459438, 'admin', 'player', 'detail', 1538835094, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459439, 'admin', 'player', 'list', 1538835098, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459440, 'admin', 'index', 'get_dev_mappoint', 1538835098, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459441, 'admin', 'player', 'list', 1538835100, 'superadmin', '{\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459442, 'admin', 'index', 'get_dev_mappoint', 1538835100, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459443, 'admin', 'player', 'detail', 1538835112, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459444, 'admin', 'player', 'detail', 1538835218, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459445, 'admin', 'player', 'detail', 1538835221, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"21\"}');
INSERT INTO `dc_action_logs` VALUES (459446, 'admin', 'player', 'detail', 1538835256, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"21\"}');
INSERT INTO `dc_action_logs` VALUES (459447, 'admin', 'player', 'detail', 1538835312, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"21\"}');
INSERT INTO `dc_action_logs` VALUES (459448, 'admin', 'player', 'detail', 1538835321, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"21\"}');
INSERT INTO `dc_action_logs` VALUES (459449, 'admin', 'player', 'detail', 1538835338, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"21\"}');
INSERT INTO `dc_action_logs` VALUES (459450, 'admin', 'player', 'detail', 1538835504, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"21\"}');
INSERT INTO `dc_action_logs` VALUES (459451, 'admin', 'player', 'detail', 1538835507, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459452, 'admin', 'player', 'list', 1538835509, 'superadmin', '{\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459453, 'admin', 'index', 'get_dev_mappoint', 1538835509, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459454, 'admin', 'player', 'list', 1538835620, 'superadmin', '{\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459455, 'admin', 'index', 'get_dev_mappoint', 1538835620, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459456, 'admin', 'player', 'detail', 1538835622, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459457, 'admin', 'player', 'detail', 1538835835, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459458, 'admin', 'player', 'detail', 1538835858, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459459, 'admin', 'index', 'get_dev_mappoint', 1538835858, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459460, 'admin', 'player', 'detail', 1538835874, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459461, 'admin', 'index', 'get_dev_mappoint', 1538835874, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459462, 'admin', 'player', 'detail', 1538835912, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459463, 'admin', 'index', 'get_dev_mappoint', 1538835912, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459464, 'admin', 'player', 'detail', 1538835988, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459465, 'admin', 'index', 'get_dev_mappoint', 1538835988, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459466, 'admin', 'player', 'list', 1538835989, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"keyname\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459467, 'admin', 'index', 'get_dev_mappoint', 1538835990, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459468, 'admin', 'player', 'detail', 1538836010, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459469, 'admin', 'index', 'get_dev_mappoint', 1538836010, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459470, 'admin', 'player', 'list', 1538836011, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"keyname\":\"player2\"}');
INSERT INTO `dc_action_logs` VALUES (459471, 'admin', 'index', 'get_dev_mappoint', 1538836011, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459472, 'admin', 'player', 'detail', 1538836013, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459473, 'admin', 'index', 'get_dev_mappoint', 1538836014, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459474, 'admin', 'player', 'list', 1538836016, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"keyname\":\"player2\"}');
INSERT INTO `dc_action_logs` VALUES (459475, 'admin', 'index', 'get_dev_mappoint', 1538836016, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459476, 'admin', 'system', 'set', 1538836018, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459477, 'admin', 'index', 'get_dev_mappoint', 1538836018, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459478, 'admin', 'index', 'index', 1538836020, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459479, 'admin', 'index', 'get_dev_mappoint', 1538836020, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459480, 'admin', 'player', 'list', 1538836021, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"menuid\":\"14\"}');
INSERT INTO `dc_action_logs` VALUES (459481, 'admin', 'index', 'get_dev_mappoint', 1538836021, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459482, 'admin', 'index', 'index', 1538836022, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459483, 'admin', 'index', 'get_dev_mappoint', 1538836022, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459484, 'admin', 'player', 'list', 1538836023, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"menuid\":\"14\"}');
INSERT INTO `dc_action_logs` VALUES (459485, 'admin', 'index', 'get_dev_mappoint', 1538836023, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459486, 'admin', 'player', 'list', 1538836127, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"menuid\":\"14\"}');
INSERT INTO `dc_action_logs` VALUES (459487, 'admin', 'player', 'list', 1538836141, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"menuid\":\"14\"}');
INSERT INTO `dc_action_logs` VALUES (459488, 'admin', 'index', 'get_dev_mappoint', 1538836141, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459489, 'admin', 'player', 'add', 1538836143, 'superadmin', '{\"_url\":\"admin\\/player\\/add\"}');
INSERT INTO `dc_action_logs` VALUES (459490, 'admin', 'player', 'list', 1538836147, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"menuid\":\"14\"}');
INSERT INTO `dc_action_logs` VALUES (459491, 'admin', 'index', 'get_dev_mappoint', 1538836147, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459492, 'admin', 'player', 'list', 1538836286, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"menuid\":\"14\"}');
INSERT INTO `dc_action_logs` VALUES (459493, 'admin', 'index', 'get_dev_mappoint', 1538836286, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459494, 'admin', 'player', 'add', 1538836287, 'superadmin', '{\"_url\":\"admin\\/player\\/add\",\"id\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459495, 'admin', 'index', 'get_dev_mappoint', 1538836287, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459496, 'admin', 'player', 'add', 1538836296, 'superadmin', '{\"_url\":\"admin\\/player\\/add\",\"id\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459497, 'admin', 'index', 'get_dev_mappoint', 1538836297, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459498, 'admin', 'player', 'add', 1538836454, 'superadmin', '{\"_url\":\"admin\\/player\\/add\",\"id\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459499, 'admin', 'index', 'get_dev_mappoint', 1538836454, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459500, 'admin', 'player', 'add', 1538836458, 'superadmin', '{\"_url\":\"admin\\/player\\/add\",\"id\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459501, 'admin', 'index', 'get_dev_mappoint', 1538836458, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459502, 'admin', 'player', 'add', 1538836468, 'superadmin', '{\"_url\":\"admin\\/player\\/add\",\"id\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459503, 'admin', 'index', 'get_dev_mappoint', 1538836468, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459504, 'admin', 'player', 'add', 1538837183, 'superadmin', '{\"_url\":\"admin\\/player\\/add\",\"id\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459505, 'admin', 'index', 'get_dev_mappoint', 1538837183, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459506, 'admin', 'player', 'update', 1538837188, 'superadmin', '{\"_url\":\"admin\\/player\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459507, 'admin', 'player', 'list', 1538837189, 'superadmin', '{\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459508, 'admin', 'index', 'get_dev_mappoint', 1538837189, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459509, 'admin', 'player', 'add', 1538837391, 'superadmin', '{\"_url\":\"admin\\/player\\/add\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459510, 'admin', 'index', 'get_dev_mappoint', 1538837391, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459511, 'admin', 'player', 'update', 1538837397, 'superadmin', '{\"_url\":\"admin\\/player\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459512, 'admin', 'player', 'list', 1538837397, 'superadmin', '{\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459513, 'admin', 'index', 'get_dev_mappoint', 1538837398, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459514, 'admin', 'player', 'detail', 1538837692, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459515, 'admin', 'player', 'detail', 1538837707, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459516, 'admin', 'index', 'get_dev_mappoint', 1538837707, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459517, 'admin', 'player', 'detail', 1538837774, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459518, 'admin', 'index', 'get_dev_mappoint', 1538837774, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459519, 'admin', 'player', 'list', 1538837780, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"keyname\":\"player1\"}');
INSERT INTO `dc_action_logs` VALUES (459520, 'admin', 'index', 'get_dev_mappoint', 1538837780, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459521, 'admin', 'index', 'index', 1538837784, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459522, 'admin', 'index', 'get_dev_mappoint', 1538837784, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459523, 'admin', 'index', 'newgame', 1538837788, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459524, 'admin', 'index', 'get_dev_mappoint', 1538837789, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459525, 'admin', 'player', 'list', 1538837790, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"menuid\":\"14\"}');
INSERT INTO `dc_action_logs` VALUES (459526, 'admin', 'index', 'get_dev_mappoint', 1538837790, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459527, 'admin', 'player', 'add', 1538837792, 'superadmin', '{\"_url\":\"admin\\/player\\/add\"}');
INSERT INTO `dc_action_logs` VALUES (459528, 'admin', 'index', 'get_dev_mappoint', 1538837793, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459529, 'admin', 'player', 'update', 1538837802, 'superadmin', '{\"_url\":\"admin\\/player\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459530, 'admin', 'player', 'update', 1538837817, 'superadmin', '{\"_url\":\"admin\\/player\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459531, 'admin', 'player', 'list', 1538837817, 'superadmin', '{\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459532, 'admin', 'index', 'get_dev_mappoint', 1538837818, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459533, 'admin', 'player', 'list', 1538837822, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"page\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459534, 'admin', 'index', 'get_dev_mappoint', 1538837823, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459535, 'admin', 'player', 'list', 1538837840, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"page\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459536, 'admin', 'index', 'get_dev_mappoint', 1538837841, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459537, 'admin', 'player', 'list', 1538837842, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"page\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459538, 'admin', 'index', 'get_dev_mappoint', 1538837842, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459539, 'admin', 'index', 'index', 1538837850, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459540, 'admin', 'index', 'get_dev_mappoint', 1538837850, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459541, 'admin', 'index', 'newgame', 1538837872, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459542, 'admin', 'index', 'get_dev_mappoint', 1538837872, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459543, 'admin', 'index', 'index', 1538837883, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459544, 'admin', 'index', 'get_dev_mappoint', 1538837884, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459545, 'admin', 'index', 'gamedetail', 1538837886, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"4\"}');
INSERT INTO `dc_action_logs` VALUES (459546, 'admin', 'index', 'get_dev_mappoint', 1538837886, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459547, 'admin', 'player', 'detail', 1538837905, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"3\"}');
INSERT INTO `dc_action_logs` VALUES (459548, 'admin', 'index', 'get_dev_mappoint', 1538837905, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459549, 'admin', 'player', 'list', 1538837908, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"keyname\":\"player2\"}');
INSERT INTO `dc_action_logs` VALUES (459550, 'admin', 'index', 'get_dev_mappoint', 1538837908, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459551, 'admin', 'player', 'list', 1538837912, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"\",\"_url\":\"admin\\/player\\/list\"}');
INSERT INTO `dc_action_logs` VALUES (459552, 'admin', 'index', 'get_dev_mappoint', 1538837912, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459553, 'admin', 'player', 'list', 1538837932, 'superadmin', '{\"keyname\":\"\",\"min\":\"\",\"max\":\"\",\"_url\":\"admin\\/player\\/list\",\"page\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459554, 'admin', 'index', 'get_dev_mappoint', 1538837932, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459555, 'admin', 'player', 'detail', 1538837934, 'superadmin', '{\"_url\":\"admin\\/player\\/detail\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459556, 'admin', 'index', 'get_dev_mappoint', 1538837935, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459557, 'admin', 'player', 'list', 1538837948, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"keyname\":\"player1\"}');
INSERT INTO `dc_action_logs` VALUES (459558, 'admin', 'index', 'get_dev_mappoint', 1538837948, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459559, 'admin', 'player', 'add', 1538837956, 'superadmin', '{\"_url\":\"admin\\/player\\/add\",\"id\":\"2\"}');
INSERT INTO `dc_action_logs` VALUES (459560, 'admin', 'index', 'get_dev_mappoint', 1538837956, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459561, 'admin', 'system', 'set', 1538837983, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459562, 'admin', 'index', 'get_dev_mappoint', 1538837983, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459563, 'admin', 'player', 'list', 1538837994, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"menuid\":\"14\"}');
INSERT INTO `dc_action_logs` VALUES (459564, 'admin', 'index', 'get_dev_mappoint', 1538837995, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459565, 'admin', 'system', 'set', 1538838000, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459566, 'admin', 'index', 'get_dev_mappoint', 1538838000, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459567, 'admin', 'system', 'update', 1538838004, 'superadmin', '{\"_url\":\"admin\\/system\\/update\"}');
INSERT INTO `dc_action_logs` VALUES (459568, 'admin', 'system', 'set', 1538838005, 'superadmin', '{\"_url\":\"admin\\/system\\/set\",\"menuid\":\"1\"}');
INSERT INTO `dc_action_logs` VALUES (459569, 'admin', 'index', 'get_dev_mappoint', 1538838005, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459570, 'admin', 'player', 'list', 1538838007, 'superadmin', '{\"_url\":\"admin\\/player\\/list\",\"menuid\":\"14\"}');
INSERT INTO `dc_action_logs` VALUES (459571, 'admin', 'index', 'get_dev_mappoint', 1538838008, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459572, 'admin', 'index', 'index', 1538838009, 'superadmin', '{\"_url\":\"admin\\/index\\/index\",\"menuid\":\"12\"}');
INSERT INTO `dc_action_logs` VALUES (459573, 'admin', 'index', 'get_dev_mappoint', 1538838009, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459574, 'admin', 'index', 'newgame', 1538838011, 'superadmin', '{\"_url\":\"admin\\/index\\/newgame\"}');
INSERT INTO `dc_action_logs` VALUES (459575, 'admin', 'index', 'get_dev_mappoint', 1538838011, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459576, 'admin', 'index', 'getname', 1538838017, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459577, 'admin', 'index', 'getname', 1538838020, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459578, 'admin', 'index', 'getname', 1538838022, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459579, 'admin', 'index', 'getname', 1538838024, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459580, 'admin', 'index', 'getname', 1538838026, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459581, 'admin', 'index', 'getname', 1538838027, 'superadmin', '{\"_url\":\"admin\\/index\\/getname\"}');
INSERT INTO `dc_action_logs` VALUES (459582, 'admin', 'index', 'savegame', 1538838129, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459583, 'admin', 'index', 'savegame', 1538838215, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459584, 'admin', 'index', 'savegame', 1538838300, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459585, 'admin', 'index', 'savegame', 1538838327, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459586, 'admin', 'index', 'savegame', 1538838353, 'superadmin', '{\"_url\":\"admin\\/index\\/savegame\"}');
INSERT INTO `dc_action_logs` VALUES (459587, 'admin', 'index', 'index', 1538838353, 'superadmin', '{\"_url\":\"admin\\/index\\/index\"}');
INSERT INTO `dc_action_logs` VALUES (459588, 'admin', 'index', 'get_dev_mappoint', 1538838354, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459589, 'admin', 'index', 'gamedetail', 1538838359, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"5\"}');
INSERT INTO `dc_action_logs` VALUES (459590, 'admin', 'index', 'get_dev_mappoint', 1538838360, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');
INSERT INTO `dc_action_logs` VALUES (459591, 'admin', 'index', 'gamedetail', 1538960436, 'superadmin', '{\"_url\":\"admin\\/index\\/gamedetail\",\"id\":\"5\"}');
INSERT INTO `dc_action_logs` VALUES (459592, 'admin', 'index', 'get_dev_mappoint', 1538960438, 'superadmin', '{\"_url\":\"admin\\/index\\/get_dev_mappoint\"}');

-- ----------------------------
-- Table structure for dc_admin__access
-- ----------------------------
DROP TABLE IF EXISTS `dc_admin__access`;
CREATE TABLE `dc_admin__access`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_type` enum('Role','User') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Role',
  `object_value` int(11) NOT NULL,
  `isallow` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0拒绝 1允许',
  `access_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_type` enum('action','page','data') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'page',
  `access_data` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '对应的菜单id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `k_masterValue_masterType`(`object_value`, `object_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3054 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_admin__access
-- ----------------------------
INSERT INTO `dc_admin__access` VALUES (1291, 'Role', 36, 1, 'admin/account/list', 'page', 'a=1', 0);
INSERT INTO `dc_admin__access` VALUES (1292, 'Role', 36, 1, 'admin/account/create', 'page', '', 0);
INSERT INTO `dc_admin__access` VALUES (1293, 'Role', 36, 1, 'admin/account/edit', 'page', 'a=1&s=s', 0);
INSERT INTO `dc_admin__access` VALUES (1294, 'Role', 36, 1, 'admin/account/delete', 'page', '', 0);
INSERT INTO `dc_admin__access` VALUES (1295, 'Role', 36, 1, 'admin/account/detail', 'page', '', 0);
INSERT INTO `dc_admin__access` VALUES (1433, 'Role', 4, 1, NULL, 'page', NULL, 152);
INSERT INTO `dc_admin__access` VALUES (1434, 'Role', 4, 1, NULL, 'page', NULL, 153);
INSERT INTO `dc_admin__access` VALUES (1435, 'Role', 4, 1, NULL, 'page', NULL, 154);
INSERT INTO `dc_admin__access` VALUES (1494, 'Role', 12, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (1495, 'Role', 12, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (1496, 'Role', 12, 1, NULL, 'page', NULL, 181);
INSERT INTO `dc_admin__access` VALUES (1497, 'Role', 12, 1, NULL, 'page', NULL, 182);
INSERT INTO `dc_admin__access` VALUES (1498, 'Role', 12, 1, NULL, 'page', NULL, 183);
INSERT INTO `dc_admin__access` VALUES (1499, 'Role', 12, 1, NULL, 'page', NULL, 198);
INSERT INTO `dc_admin__access` VALUES (1500, 'Role', 12, 1, NULL, 'page', NULL, 199);
INSERT INTO `dc_admin__access` VALUES (1501, 'Role', 12, 1, NULL, 'page', NULL, 200);
INSERT INTO `dc_admin__access` VALUES (1502, 'Role', 12, 1, NULL, 'page', NULL, 201);
INSERT INTO `dc_admin__access` VALUES (1503, 'Role', 12, 1, NULL, 'page', NULL, 202);
INSERT INTO `dc_admin__access` VALUES (1504, 'Role', 12, 1, NULL, 'page', NULL, 203);
INSERT INTO `dc_admin__access` VALUES (1841, 'Role', 25, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (1842, 'Role', 25, 1, NULL, 'page', NULL, 181);
INSERT INTO `dc_admin__access` VALUES (1843, 'Role', 25, 1, NULL, 'page', NULL, 182);
INSERT INTO `dc_admin__access` VALUES (1844, 'Role', 22, 1, NULL, 'page', NULL, 12);
INSERT INTO `dc_admin__access` VALUES (1845, 'Role', 22, 1, NULL, 'page', NULL, 164);
INSERT INTO `dc_admin__access` VALUES (1846, 'Role', 22, 1, NULL, 'page', NULL, 165);
INSERT INTO `dc_admin__access` VALUES (1847, 'Role', 22, 1, NULL, 'page', NULL, 166);
INSERT INTO `dc_admin__access` VALUES (1848, 'Role', 22, 1, NULL, 'page', NULL, 167);
INSERT INTO `dc_admin__access` VALUES (1849, 'Role', 22, 1, NULL, 'page', NULL, 168);
INSERT INTO `dc_admin__access` VALUES (1850, 'Role', 22, 1, NULL, 'page', NULL, 169);
INSERT INTO `dc_admin__access` VALUES (1851, 'Role', 22, 1, NULL, 'page', NULL, 171);
INSERT INTO `dc_admin__access` VALUES (1852, 'Role', 22, 1, NULL, 'page', NULL, 176);
INSERT INTO `dc_admin__access` VALUES (1853, 'Role', 22, 1, NULL, 'page', NULL, 172);
INSERT INTO `dc_admin__access` VALUES (1854, 'Role', 22, 1, NULL, 'page', NULL, 173);
INSERT INTO `dc_admin__access` VALUES (1855, 'Role', 22, 1, NULL, 'page', NULL, 174);
INSERT INTO `dc_admin__access` VALUES (1856, 'Role', 22, 1, NULL, 'page', NULL, 177);
INSERT INTO `dc_admin__access` VALUES (1857, 'Role', 22, 1, NULL, 'page', NULL, 187);
INSERT INTO `dc_admin__access` VALUES (1858, 'Role', 22, 1, NULL, 'page', NULL, 189);
INSERT INTO `dc_admin__access` VALUES (1859, 'Role', 22, 1, NULL, 'page', NULL, 191);
INSERT INTO `dc_admin__access` VALUES (1860, 'Role', 22, 1, NULL, 'page', NULL, 193);
INSERT INTO `dc_admin__access` VALUES (1861, 'Role', 22, 1, NULL, 'page', NULL, 194);
INSERT INTO `dc_admin__access` VALUES (1862, 'Role', 22, 1, NULL, 'page', NULL, 195);
INSERT INTO `dc_admin__access` VALUES (1863, 'Role', 22, 1, NULL, 'page', NULL, 1);
INSERT INTO `dc_admin__access` VALUES (1864, 'Role', 22, 1, NULL, 'page', NULL, 2);
INSERT INTO `dc_admin__access` VALUES (1865, 'Role', 22, 1, NULL, 'page', NULL, 3);
INSERT INTO `dc_admin__access` VALUES (1866, 'Role', 22, 1, NULL, 'page', NULL, 4);
INSERT INTO `dc_admin__access` VALUES (1867, 'Role', 22, 1, NULL, 'page', NULL, 5);
INSERT INTO `dc_admin__access` VALUES (1868, 'Role', 22, 1, NULL, 'page', NULL, 6);
INSERT INTO `dc_admin__access` VALUES (1869, 'Role', 22, 1, NULL, 'page', NULL, 7);
INSERT INTO `dc_admin__access` VALUES (1870, 'Role', 22, 1, NULL, 'page', NULL, 8);
INSERT INTO `dc_admin__access` VALUES (1871, 'Role', 22, 1, NULL, 'page', NULL, 9);
INSERT INTO `dc_admin__access` VALUES (1872, 'Role', 22, 1, NULL, 'page', NULL, 10);
INSERT INTO `dc_admin__access` VALUES (1873, 'Role', 22, 1, NULL, 'page', NULL, 134);
INSERT INTO `dc_admin__access` VALUES (1874, 'Role', 22, 1, NULL, 'page', NULL, 136);
INSERT INTO `dc_admin__access` VALUES (1875, 'Role', 15, 1, NULL, 'page', NULL, 12);
INSERT INTO `dc_admin__access` VALUES (1876, 'Role', 15, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (1877, 'Role', 15, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (1878, 'Role', 15, 1, NULL, 'page', NULL, 181);
INSERT INTO `dc_admin__access` VALUES (1879, 'Role', 15, 1, NULL, 'page', NULL, 182);
INSERT INTO `dc_admin__access` VALUES (1880, 'Role', 15, 1, NULL, 'page', NULL, 183);
INSERT INTO `dc_admin__access` VALUES (1881, 'Role', 15, 1, NULL, 'page', NULL, 198);
INSERT INTO `dc_admin__access` VALUES (1882, 'Role', 15, 1, NULL, 'page', NULL, 200);
INSERT INTO `dc_admin__access` VALUES (1883, 'Role', 15, 1, NULL, 'page', NULL, 201);
INSERT INTO `dc_admin__access` VALUES (1884, 'Role', 15, 1, NULL, 'page', NULL, 202);
INSERT INTO `dc_admin__access` VALUES (1885, 'Role', 15, 1, NULL, 'page', NULL, 203);
INSERT INTO `dc_admin__access` VALUES (1886, 'Role', 15, 1, NULL, 'page', NULL, 204);
INSERT INTO `dc_admin__access` VALUES (1887, 'Role', 15, 1, NULL, 'page', NULL, 163);
INSERT INTO `dc_admin__access` VALUES (1888, 'Role', 15, 1, NULL, 'page', NULL, 184);
INSERT INTO `dc_admin__access` VALUES (1889, 'Role', 15, 1, NULL, 'page', NULL, 185);
INSERT INTO `dc_admin__access` VALUES (1890, 'Role', 15, 1, NULL, 'page', NULL, 186);
INSERT INTO `dc_admin__access` VALUES (1891, 'Role', 15, 1, NULL, 'page', NULL, 164);
INSERT INTO `dc_admin__access` VALUES (1892, 'Role', 15, 1, NULL, 'page', NULL, 165);
INSERT INTO `dc_admin__access` VALUES (1893, 'Role', 15, 1, NULL, 'page', NULL, 166);
INSERT INTO `dc_admin__access` VALUES (1894, 'Role', 15, 1, NULL, 'page', NULL, 167);
INSERT INTO `dc_admin__access` VALUES (1895, 'Role', 15, 1, NULL, 'page', NULL, 168);
INSERT INTO `dc_admin__access` VALUES (1896, 'Role', 15, 1, NULL, 'page', NULL, 169);
INSERT INTO `dc_admin__access` VALUES (1897, 'Role', 15, 1, NULL, 'page', NULL, 177);
INSERT INTO `dc_admin__access` VALUES (1898, 'Role', 15, 1, NULL, 'page', NULL, 187);
INSERT INTO `dc_admin__access` VALUES (1899, 'Role', 15, 1, NULL, 'page', NULL, 189);
INSERT INTO `dc_admin__access` VALUES (1900, 'Role', 15, 1, NULL, 'page', NULL, 191);
INSERT INTO `dc_admin__access` VALUES (1901, 'Role', 15, 1, NULL, 'page', NULL, 193);
INSERT INTO `dc_admin__access` VALUES (1902, 'Role', 15, 1, NULL, 'page', NULL, 194);
INSERT INTO `dc_admin__access` VALUES (1903, 'Role', 15, 1, NULL, 'page', NULL, 195);
INSERT INTO `dc_admin__access` VALUES (1904, 'Role', 15, 1, NULL, 'page', NULL, 188);
INSERT INTO `dc_admin__access` VALUES (1905, 'Role', 15, 1, NULL, 'page', NULL, 178);
INSERT INTO `dc_admin__access` VALUES (1906, 'Role', 15, 1, NULL, 'page', NULL, 179);
INSERT INTO `dc_admin__access` VALUES (1907, 'Role', 15, 1, NULL, 'page', NULL, 180);
INSERT INTO `dc_admin__access` VALUES (1908, 'Role', 15, 1, NULL, 'page', NULL, 197);
INSERT INTO `dc_admin__access` VALUES (1909, 'Role', 15, 1, NULL, 'page', NULL, 1);
INSERT INTO `dc_admin__access` VALUES (1910, 'Role', 15, 1, NULL, 'page', NULL, 2);
INSERT INTO `dc_admin__access` VALUES (1911, 'Role', 15, 1, NULL, 'page', NULL, 3);
INSERT INTO `dc_admin__access` VALUES (1912, 'Role', 15, 1, NULL, 'page', NULL, 4);
INSERT INTO `dc_admin__access` VALUES (1913, 'Role', 15, 1, NULL, 'page', NULL, 5);
INSERT INTO `dc_admin__access` VALUES (1914, 'Role', 15, 1, NULL, 'page', NULL, 6);
INSERT INTO `dc_admin__access` VALUES (1915, 'Role', 15, 1, NULL, 'page', NULL, 7);
INSERT INTO `dc_admin__access` VALUES (1916, 'Role', 15, 1, NULL, 'page', NULL, 8);
INSERT INTO `dc_admin__access` VALUES (1917, 'Role', 15, 1, NULL, 'page', NULL, 9);
INSERT INTO `dc_admin__access` VALUES (1918, 'Role', 15, 1, NULL, 'page', NULL, 10);
INSERT INTO `dc_admin__access` VALUES (1919, 'Role', 15, 1, NULL, 'page', NULL, 134);
INSERT INTO `dc_admin__access` VALUES (1920, 'Role', 15, 1, NULL, 'page', NULL, 136);
INSERT INTO `dc_admin__access` VALUES (1921, 'Role', 28, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (1922, 'Role', 28, 1, NULL, 'page', NULL, 181);
INSERT INTO `dc_admin__access` VALUES (1923, 'Role', 28, 1, NULL, 'page', NULL, 182);
INSERT INTO `dc_admin__access` VALUES (1924, 'Role', 40, 1, NULL, 'page', NULL, 12);
INSERT INTO `dc_admin__access` VALUES (1927, 'Role', 51, 1, NULL, 'page', NULL, 12);
INSERT INTO `dc_admin__access` VALUES (1928, 'Role', 51, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (1929, 'Role', 51, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (1930, 'Role', 51, 1, NULL, 'page', NULL, 181);
INSERT INTO `dc_admin__access` VALUES (1931, 'Role', 51, 1, NULL, 'page', NULL, 182);
INSERT INTO `dc_admin__access` VALUES (1932, 'Role', 51, 1, NULL, 'page', NULL, 183);
INSERT INTO `dc_admin__access` VALUES (1933, 'Role', 51, 1, NULL, 'page', NULL, 198);
INSERT INTO `dc_admin__access` VALUES (1934, 'Role', 51, 1, NULL, 'page', NULL, 200);
INSERT INTO `dc_admin__access` VALUES (1935, 'Role', 51, 1, NULL, 'page', NULL, 201);
INSERT INTO `dc_admin__access` VALUES (1936, 'Role', 51, 1, NULL, 'page', NULL, 202);
INSERT INTO `dc_admin__access` VALUES (1937, 'Role', 51, 1, NULL, 'page', NULL, 203);
INSERT INTO `dc_admin__access` VALUES (1938, 'Role', 51, 1, NULL, 'page', NULL, 204);
INSERT INTO `dc_admin__access` VALUES (1943, 'Role', 50, 1, NULL, 'page', NULL, 12);
INSERT INTO `dc_admin__access` VALUES (1944, 'Role', 50, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (1945, 'Role', 50, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (1946, 'Role', 50, 1, NULL, 'page', NULL, 181);
INSERT INTO `dc_admin__access` VALUES (1947, 'Role', 50, 1, NULL, 'page', NULL, 182);
INSERT INTO `dc_admin__access` VALUES (1948, 'Role', 50, 1, NULL, 'page', NULL, 183);
INSERT INTO `dc_admin__access` VALUES (1949, 'Role', 50, 1, NULL, 'page', NULL, 198);
INSERT INTO `dc_admin__access` VALUES (1950, 'Role', 50, 1, NULL, 'page', NULL, 200);
INSERT INTO `dc_admin__access` VALUES (1951, 'Role', 50, 1, NULL, 'page', NULL, 201);
INSERT INTO `dc_admin__access` VALUES (1952, 'Role', 50, 1, NULL, 'page', NULL, 202);
INSERT INTO `dc_admin__access` VALUES (1953, 'Role', 50, 1, NULL, 'page', NULL, 203);
INSERT INTO `dc_admin__access` VALUES (1954, 'Role', 50, 1, NULL, 'page', NULL, 204);
INSERT INTO `dc_admin__access` VALUES (1955, 'Role', 50, 1, NULL, 'page', NULL, 163);
INSERT INTO `dc_admin__access` VALUES (1956, 'Role', 50, 1, NULL, 'page', NULL, 184);
INSERT INTO `dc_admin__access` VALUES (1957, 'Role', 50, 1, NULL, 'page', NULL, 185);
INSERT INTO `dc_admin__access` VALUES (1958, 'Role', 50, 1, NULL, 'page', NULL, 186);
INSERT INTO `dc_admin__access` VALUES (1959, 'Role', 50, 1, NULL, 'page', NULL, 164);
INSERT INTO `dc_admin__access` VALUES (1960, 'Role', 50, 1, NULL, 'page', NULL, 165);
INSERT INTO `dc_admin__access` VALUES (1961, 'Role', 50, 1, NULL, 'page', NULL, 166);
INSERT INTO `dc_admin__access` VALUES (1962, 'Role', 50, 1, NULL, 'page', NULL, 167);
INSERT INTO `dc_admin__access` VALUES (1963, 'Role', 50, 1, NULL, 'page', NULL, 168);
INSERT INTO `dc_admin__access` VALUES (1964, 'Role', 50, 1, NULL, 'page', NULL, 169);
INSERT INTO `dc_admin__access` VALUES (1965, 'Role', 50, 1, NULL, 'page', NULL, 171);
INSERT INTO `dc_admin__access` VALUES (1966, 'Role', 50, 1, NULL, 'page', NULL, 176);
INSERT INTO `dc_admin__access` VALUES (1967, 'Role', 50, 1, NULL, 'page', NULL, 172);
INSERT INTO `dc_admin__access` VALUES (1968, 'Role', 50, 1, NULL, 'page', NULL, 173);
INSERT INTO `dc_admin__access` VALUES (1969, 'Role', 50, 1, NULL, 'page', NULL, 174);
INSERT INTO `dc_admin__access` VALUES (1970, 'Role', 50, 1, NULL, 'page', NULL, 177);
INSERT INTO `dc_admin__access` VALUES (1971, 'Role', 50, 1, NULL, 'page', NULL, 187);
INSERT INTO `dc_admin__access` VALUES (1972, 'Role', 50, 1, NULL, 'page', NULL, 191);
INSERT INTO `dc_admin__access` VALUES (1973, 'Role', 50, 1, NULL, 'page', NULL, 193);
INSERT INTO `dc_admin__access` VALUES (1974, 'Role', 50, 1, NULL, 'page', NULL, 194);
INSERT INTO `dc_admin__access` VALUES (1975, 'Role', 50, 1, NULL, 'page', NULL, 195);
INSERT INTO `dc_admin__access` VALUES (1976, 'Role', 50, 1, NULL, 'page', NULL, 205);
INSERT INTO `dc_admin__access` VALUES (1977, 'Role', 50, 1, NULL, 'page', NULL, 188);
INSERT INTO `dc_admin__access` VALUES (1978, 'Role', 50, 1, NULL, 'page', NULL, 178);
INSERT INTO `dc_admin__access` VALUES (1979, 'Role', 50, 1, NULL, 'page', NULL, 179);
INSERT INTO `dc_admin__access` VALUES (1980, 'Role', 50, 1, NULL, 'page', NULL, 180);
INSERT INTO `dc_admin__access` VALUES (1981, 'Role', 50, 1, NULL, 'page', NULL, 197);
INSERT INTO `dc_admin__access` VALUES (1982, 'Role', 50, 1, NULL, 'page', NULL, 1);
INSERT INTO `dc_admin__access` VALUES (1983, 'Role', 50, 1, NULL, 'page', NULL, 2);
INSERT INTO `dc_admin__access` VALUES (1984, 'Role', 50, 1, NULL, 'page', NULL, 3);
INSERT INTO `dc_admin__access` VALUES (1985, 'Role', 50, 1, NULL, 'page', NULL, 4);
INSERT INTO `dc_admin__access` VALUES (1986, 'Role', 50, 1, NULL, 'page', NULL, 5);
INSERT INTO `dc_admin__access` VALUES (1987, 'Role', 50, 1, NULL, 'page', NULL, 6);
INSERT INTO `dc_admin__access` VALUES (1988, 'Role', 50, 1, NULL, 'page', NULL, 7);
INSERT INTO `dc_admin__access` VALUES (1989, 'Role', 50, 1, NULL, 'page', NULL, 8);
INSERT INTO `dc_admin__access` VALUES (1990, 'Role', 50, 1, NULL, 'page', NULL, 9);
INSERT INTO `dc_admin__access` VALUES (1991, 'Role', 50, 1, NULL, 'page', NULL, 10);
INSERT INTO `dc_admin__access` VALUES (1992, 'Role', 50, 1, NULL, 'page', NULL, 134);
INSERT INTO `dc_admin__access` VALUES (1993, 'Role', 50, 1, NULL, 'page', NULL, 136);
INSERT INTO `dc_admin__access` VALUES (1994, 'Role', 46, 1, NULL, 'page', NULL, 12);
INSERT INTO `dc_admin__access` VALUES (1995, 'Role', 46, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (1996, 'Role', 46, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (1997, 'Role', 46, 1, NULL, 'page', NULL, 181);
INSERT INTO `dc_admin__access` VALUES (1998, 'Role', 46, 1, NULL, 'page', NULL, 182);
INSERT INTO `dc_admin__access` VALUES (1999, 'Role', 46, 1, NULL, 'page', NULL, 183);
INSERT INTO `dc_admin__access` VALUES (2000, 'Role', 46, 1, NULL, 'page', NULL, 198);
INSERT INTO `dc_admin__access` VALUES (2001, 'Role', 46, 1, NULL, 'page', NULL, 200);
INSERT INTO `dc_admin__access` VALUES (2002, 'Role', 46, 1, NULL, 'page', NULL, 201);
INSERT INTO `dc_admin__access` VALUES (2003, 'Role', 46, 1, NULL, 'page', NULL, 202);
INSERT INTO `dc_admin__access` VALUES (2004, 'Role', 46, 1, NULL, 'page', NULL, 203);
INSERT INTO `dc_admin__access` VALUES (2005, 'Role', 46, 1, NULL, 'page', NULL, 204);
INSERT INTO `dc_admin__access` VALUES (2006, 'Role', 46, 1, NULL, 'page', NULL, 207);
INSERT INTO `dc_admin__access` VALUES (2007, 'Role', 46, 1, NULL, 'page', NULL, 209);
INSERT INTO `dc_admin__access` VALUES (2008, 'Role', 46, 1, NULL, 'page', NULL, 208);
INSERT INTO `dc_admin__access` VALUES (2009, 'Role', 46, 1, NULL, 'page', NULL, 163);
INSERT INTO `dc_admin__access` VALUES (2010, 'Role', 46, 1, NULL, 'page', NULL, 184);
INSERT INTO `dc_admin__access` VALUES (2011, 'Role', 46, 1, NULL, 'page', NULL, 185);
INSERT INTO `dc_admin__access` VALUES (2012, 'Role', 46, 1, NULL, 'page', NULL, 186);
INSERT INTO `dc_admin__access` VALUES (2013, 'Role', 46, 1, NULL, 'page', NULL, 164);
INSERT INTO `dc_admin__access` VALUES (2014, 'Role', 46, 1, NULL, 'page', NULL, 165);
INSERT INTO `dc_admin__access` VALUES (2015, 'Role', 46, 1, NULL, 'page', NULL, 166);
INSERT INTO `dc_admin__access` VALUES (2016, 'Role', 46, 1, NULL, 'page', NULL, 167);
INSERT INTO `dc_admin__access` VALUES (2017, 'Role', 46, 1, NULL, 'page', NULL, 168);
INSERT INTO `dc_admin__access` VALUES (2018, 'Role', 46, 1, NULL, 'page', NULL, 169);
INSERT INTO `dc_admin__access` VALUES (2019, 'Role', 46, 1, NULL, 'page', NULL, 171);
INSERT INTO `dc_admin__access` VALUES (2020, 'Role', 46, 1, NULL, 'page', NULL, 176);
INSERT INTO `dc_admin__access` VALUES (2021, 'Role', 46, 1, NULL, 'page', NULL, 172);
INSERT INTO `dc_admin__access` VALUES (2022, 'Role', 46, 1, NULL, 'page', NULL, 173);
INSERT INTO `dc_admin__access` VALUES (2023, 'Role', 46, 1, NULL, 'page', NULL, 174);
INSERT INTO `dc_admin__access` VALUES (2024, 'Role', 46, 1, NULL, 'page', NULL, 177);
INSERT INTO `dc_admin__access` VALUES (2025, 'Role', 46, 1, NULL, 'page', NULL, 187);
INSERT INTO `dc_admin__access` VALUES (2026, 'Role', 46, 1, NULL, 'page', NULL, 191);
INSERT INTO `dc_admin__access` VALUES (2027, 'Role', 46, 1, NULL, 'page', NULL, 193);
INSERT INTO `dc_admin__access` VALUES (2028, 'Role', 46, 1, NULL, 'page', NULL, 194);
INSERT INTO `dc_admin__access` VALUES (2029, 'Role', 46, 1, NULL, 'page', NULL, 195);
INSERT INTO `dc_admin__access` VALUES (2030, 'Role', 46, 1, NULL, 'page', NULL, 205);
INSERT INTO `dc_admin__access` VALUES (2031, 'Role', 58, 1, NULL, 'page', NULL, 210);
INSERT INTO `dc_admin__access` VALUES (2032, 'Role', 58, 1, NULL, 'page', NULL, 12);
INSERT INTO `dc_admin__access` VALUES (2033, 'Role', 58, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (2034, 'Role', 58, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (2035, 'Role', 58, 1, NULL, 'page', NULL, 181);
INSERT INTO `dc_admin__access` VALUES (2036, 'Role', 58, 1, NULL, 'page', NULL, 182);
INSERT INTO `dc_admin__access` VALUES (2037, 'Role', 58, 1, NULL, 'page', NULL, 183);
INSERT INTO `dc_admin__access` VALUES (2038, 'Role', 58, 1, NULL, 'page', NULL, 198);
INSERT INTO `dc_admin__access` VALUES (2039, 'Role', 58, 1, NULL, 'page', NULL, 200);
INSERT INTO `dc_admin__access` VALUES (2040, 'Role', 58, 1, NULL, 'page', NULL, 201);
INSERT INTO `dc_admin__access` VALUES (2041, 'Role', 58, 1, NULL, 'page', NULL, 202);
INSERT INTO `dc_admin__access` VALUES (2042, 'Role', 58, 1, NULL, 'page', NULL, 203);
INSERT INTO `dc_admin__access` VALUES (2043, 'Role', 58, 1, NULL, 'page', NULL, 204);
INSERT INTO `dc_admin__access` VALUES (2044, 'Role', 58, 1, NULL, 'page', NULL, 207);
INSERT INTO `dc_admin__access` VALUES (2045, 'Role', 58, 1, NULL, 'page', NULL, 209);
INSERT INTO `dc_admin__access` VALUES (2046, 'Role', 58, 1, NULL, 'page', NULL, 208);
INSERT INTO `dc_admin__access` VALUES (2047, 'Role', 58, 1, NULL, 'page', NULL, 163);
INSERT INTO `dc_admin__access` VALUES (2048, 'Role', 58, 1, NULL, 'page', NULL, 184);
INSERT INTO `dc_admin__access` VALUES (2049, 'Role', 58, 1, NULL, 'page', NULL, 185);
INSERT INTO `dc_admin__access` VALUES (2050, 'Role', 58, 1, NULL, 'page', NULL, 186);
INSERT INTO `dc_admin__access` VALUES (2051, 'Role', 58, 1, NULL, 'page', NULL, 164);
INSERT INTO `dc_admin__access` VALUES (2052, 'Role', 58, 1, NULL, 'page', NULL, 165);
INSERT INTO `dc_admin__access` VALUES (2053, 'Role', 58, 1, NULL, 'page', NULL, 166);
INSERT INTO `dc_admin__access` VALUES (2054, 'Role', 58, 1, NULL, 'page', NULL, 167);
INSERT INTO `dc_admin__access` VALUES (2055, 'Role', 58, 1, NULL, 'page', NULL, 168);
INSERT INTO `dc_admin__access` VALUES (2056, 'Role', 58, 1, NULL, 'page', NULL, 169);
INSERT INTO `dc_admin__access` VALUES (2057, 'Role', 58, 1, NULL, 'page', NULL, 171);
INSERT INTO `dc_admin__access` VALUES (2058, 'Role', 58, 1, NULL, 'page', NULL, 176);
INSERT INTO `dc_admin__access` VALUES (2059, 'Role', 58, 1, NULL, 'page', NULL, 172);
INSERT INTO `dc_admin__access` VALUES (2060, 'Role', 58, 1, NULL, 'page', NULL, 173);
INSERT INTO `dc_admin__access` VALUES (2061, 'Role', 58, 1, NULL, 'page', NULL, 174);
INSERT INTO `dc_admin__access` VALUES (2062, 'Role', 58, 1, NULL, 'page', NULL, 177);
INSERT INTO `dc_admin__access` VALUES (2063, 'Role', 58, 1, NULL, 'page', NULL, 187);
INSERT INTO `dc_admin__access` VALUES (2064, 'Role', 58, 1, NULL, 'page', NULL, 191);
INSERT INTO `dc_admin__access` VALUES (2065, 'Role', 58, 1, NULL, 'page', NULL, 193);
INSERT INTO `dc_admin__access` VALUES (2066, 'Role', 58, 1, NULL, 'page', NULL, 194);
INSERT INTO `dc_admin__access` VALUES (2067, 'Role', 58, 1, NULL, 'page', NULL, 195);
INSERT INTO `dc_admin__access` VALUES (2068, 'Role', 58, 1, NULL, 'page', NULL, 205);
INSERT INTO `dc_admin__access` VALUES (2069, 'Role', 58, 1, NULL, 'page', NULL, 188);
INSERT INTO `dc_admin__access` VALUES (2070, 'Role', 58, 1, NULL, 'page', NULL, 178);
INSERT INTO `dc_admin__access` VALUES (2071, 'Role', 58, 1, NULL, 'page', NULL, 179);
INSERT INTO `dc_admin__access` VALUES (2072, 'Role', 58, 1, NULL, 'page', NULL, 180);
INSERT INTO `dc_admin__access` VALUES (2073, 'Role', 58, 1, NULL, 'page', NULL, 197);
INSERT INTO `dc_admin__access` VALUES (2074, 'Role', 58, 1, NULL, 'page', NULL, 206);
INSERT INTO `dc_admin__access` VALUES (2075, 'Role', 58, 1, NULL, 'page', NULL, 1);
INSERT INTO `dc_admin__access` VALUES (2076, 'Role', 58, 1, NULL, 'page', NULL, 2);
INSERT INTO `dc_admin__access` VALUES (2077, 'Role', 58, 1, NULL, 'page', NULL, 3);
INSERT INTO `dc_admin__access` VALUES (2078, 'Role', 58, 1, NULL, 'page', NULL, 4);
INSERT INTO `dc_admin__access` VALUES (2079, 'Role', 58, 1, NULL, 'page', NULL, 5);
INSERT INTO `dc_admin__access` VALUES (2080, 'Role', 58, 1, NULL, 'page', NULL, 6);
INSERT INTO `dc_admin__access` VALUES (2081, 'Role', 58, 1, NULL, 'page', NULL, 7);
INSERT INTO `dc_admin__access` VALUES (2082, 'Role', 58, 1, NULL, 'page', NULL, 8);
INSERT INTO `dc_admin__access` VALUES (2083, 'Role', 58, 1, NULL, 'page', NULL, 9);
INSERT INTO `dc_admin__access` VALUES (2084, 'Role', 58, 1, NULL, 'page', NULL, 10);
INSERT INTO `dc_admin__access` VALUES (2085, 'Role', 58, 1, NULL, 'page', NULL, 134);
INSERT INTO `dc_admin__access` VALUES (2086, 'Role', 58, 1, NULL, 'page', NULL, 136);
INSERT INTO `dc_admin__access` VALUES (2128, 'Role', 60, 1, NULL, 'page', NULL, 12);
INSERT INTO `dc_admin__access` VALUES (2129, 'Role', 60, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (2130, 'Role', 60, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (2131, 'Role', 60, 1, NULL, 'page', NULL, 181);
INSERT INTO `dc_admin__access` VALUES (2132, 'Role', 60, 1, NULL, 'page', NULL, 182);
INSERT INTO `dc_admin__access` VALUES (2133, 'Role', 60, 1, NULL, 'page', NULL, 183);
INSERT INTO `dc_admin__access` VALUES (2134, 'Role', 60, 1, NULL, 'page', NULL, 198);
INSERT INTO `dc_admin__access` VALUES (2135, 'Role', 60, 1, NULL, 'page', NULL, 200);
INSERT INTO `dc_admin__access` VALUES (2136, 'Role', 60, 1, NULL, 'page', NULL, 201);
INSERT INTO `dc_admin__access` VALUES (2137, 'Role', 60, 1, NULL, 'page', NULL, 202);
INSERT INTO `dc_admin__access` VALUES (2138, 'Role', 60, 1, NULL, 'page', NULL, 203);
INSERT INTO `dc_admin__access` VALUES (2139, 'Role', 60, 1, NULL, 'page', NULL, 204);
INSERT INTO `dc_admin__access` VALUES (2140, 'Role', 60, 1, NULL, 'page', NULL, 207);
INSERT INTO `dc_admin__access` VALUES (2141, 'Role', 60, 1, NULL, 'page', NULL, 209);
INSERT INTO `dc_admin__access` VALUES (2142, 'Role', 60, 1, NULL, 'page', NULL, 208);
INSERT INTO `dc_admin__access` VALUES (2143, 'Role', 60, 1, NULL, 'page', NULL, 211);
INSERT INTO `dc_admin__access` VALUES (2144, 'Role', 60, 1, NULL, 'page', NULL, 212);
INSERT INTO `dc_admin__access` VALUES (2145, 'Role', 60, 1, NULL, 'page', NULL, 215);
INSERT INTO `dc_admin__access` VALUES (2146, 'Role', 60, 1, NULL, 'page', NULL, 213);
INSERT INTO `dc_admin__access` VALUES (2147, 'Role', 60, 1, NULL, 'page', NULL, 214);
INSERT INTO `dc_admin__access` VALUES (2148, 'Role', 60, 1, NULL, 'page', NULL, 217);
INSERT INTO `dc_admin__access` VALUES (2149, 'Role', 60, 1, NULL, 'page', NULL, 163);
INSERT INTO `dc_admin__access` VALUES (2150, 'Role', 60, 1, NULL, 'page', NULL, 184);
INSERT INTO `dc_admin__access` VALUES (2151, 'Role', 60, 1, NULL, 'page', NULL, 185);
INSERT INTO `dc_admin__access` VALUES (2152, 'Role', 60, 1, NULL, 'page', NULL, 186);
INSERT INTO `dc_admin__access` VALUES (2177, 'Role', 62, 1, NULL, 'page', NULL, 12);
INSERT INTO `dc_admin__access` VALUES (2178, 'Role', 62, 1, NULL, 'page', NULL, 163);
INSERT INTO `dc_admin__access` VALUES (2179, 'Role', 62, 1, NULL, 'page', NULL, 184);
INSERT INTO `dc_admin__access` VALUES (2180, 'Role', 62, 1, NULL, 'page', NULL, 185);
INSERT INTO `dc_admin__access` VALUES (2181, 'Role', 62, 1, NULL, 'page', NULL, 186);
INSERT INTO `dc_admin__access` VALUES (2199, 'Role', 78, 1, NULL, 'page', NULL, 1);
INSERT INTO `dc_admin__access` VALUES (2200, 'Role', 78, 1, NULL, 'page', NULL, 2);
INSERT INTO `dc_admin__access` VALUES (2201, 'Role', 78, 1, NULL, 'page', NULL, 3);
INSERT INTO `dc_admin__access` VALUES (2202, 'Role', 78, 1, NULL, 'page', NULL, 4);
INSERT INTO `dc_admin__access` VALUES (2203, 'Role', 78, 1, NULL, 'page', NULL, 5);
INSERT INTO `dc_admin__access` VALUES (2204, 'Role', 78, 1, NULL, 'page', NULL, 6);
INSERT INTO `dc_admin__access` VALUES (2205, 'Role', 78, 1, NULL, 'page', NULL, 7);
INSERT INTO `dc_admin__access` VALUES (2206, 'Role', 78, 1, NULL, 'page', NULL, 8);
INSERT INTO `dc_admin__access` VALUES (2207, 'Role', 78, 1, NULL, 'page', NULL, 9);
INSERT INTO `dc_admin__access` VALUES (2208, 'Role', 78, 1, NULL, 'page', NULL, 10);
INSERT INTO `dc_admin__access` VALUES (2209, 'Role', 78, 1, NULL, 'page', NULL, 134);
INSERT INTO `dc_admin__access` VALUES (2210, 'Role', 78, 1, NULL, 'page', NULL, 136);
INSERT INTO `dc_admin__access` VALUES (2211, 'Role', 78, 1, NULL, 'page', NULL, 177);
INSERT INTO `dc_admin__access` VALUES (2218, 'Role', 76, 1, NULL, 'page', NULL, 178);
INSERT INTO `dc_admin__access` VALUES (2219, 'Role', 76, 1, NULL, 'page', NULL, 179);
INSERT INTO `dc_admin__access` VALUES (2220, 'Role', 76, 1, NULL, 'page', NULL, 180);
INSERT INTO `dc_admin__access` VALUES (2221, 'Role', 76, 1, NULL, 'page', NULL, 197);
INSERT INTO `dc_admin__access` VALUES (2222, 'Role', 76, 1, NULL, 'page', NULL, 206);
INSERT INTO `dc_admin__access` VALUES (2223, 'Role', 79, 1, NULL, 'page', NULL, 229);
INSERT INTO `dc_admin__access` VALUES (2224, 'Role', 75, 1, NULL, 'page', NULL, 187);
INSERT INTO `dc_admin__access` VALUES (2225, 'Role', 75, 1, NULL, 'page', NULL, 191);
INSERT INTO `dc_admin__access` VALUES (2226, 'Role', 75, 1, NULL, 'page', NULL, 193);
INSERT INTO `dc_admin__access` VALUES (2227, 'Role', 75, 1, NULL, 'page', NULL, 194);
INSERT INTO `dc_admin__access` VALUES (2228, 'Role', 75, 1, NULL, 'page', NULL, 195);
INSERT INTO `dc_admin__access` VALUES (2229, 'Role', 75, 1, NULL, 'page', NULL, 205);
INSERT INTO `dc_admin__access` VALUES (2230, 'Role', 77, 1, NULL, 'page', NULL, 218);
INSERT INTO `dc_admin__access` VALUES (2231, 'Role', 77, 1, NULL, 'page', NULL, 178);
INSERT INTO `dc_admin__access` VALUES (2232, 'Role', 74, 1, NULL, 'page', NULL, 164);
INSERT INTO `dc_admin__access` VALUES (2233, 'Role', 74, 1, NULL, 'page', NULL, 219);
INSERT INTO `dc_admin__access` VALUES (2234, 'Role', 74, 1, NULL, 'page', NULL, 220);
INSERT INTO `dc_admin__access` VALUES (2235, 'Role', 74, 1, NULL, 'page', NULL, 221);
INSERT INTO `dc_admin__access` VALUES (2236, 'Role', 73, 1, NULL, 'page', NULL, 177);
INSERT INTO `dc_admin__access` VALUES (2237, 'Role', 72, 1, NULL, 'page', NULL, 164);
INSERT INTO `dc_admin__access` VALUES (2238, 'Role', 72, 1, NULL, 'page', NULL, 165);
INSERT INTO `dc_admin__access` VALUES (2239, 'Role', 72, 1, NULL, 'page', NULL, 166);
INSERT INTO `dc_admin__access` VALUES (2240, 'Role', 72, 1, NULL, 'page', NULL, 167);
INSERT INTO `dc_admin__access` VALUES (2241, 'Role', 72, 1, NULL, 'page', NULL, 168);
INSERT INTO `dc_admin__access` VALUES (2242, 'Role', 72, 1, NULL, 'page', NULL, 169);
INSERT INTO `dc_admin__access` VALUES (2243, 'Role', 72, 1, NULL, 'page', NULL, 171);
INSERT INTO `dc_admin__access` VALUES (2244, 'Role', 72, 1, NULL, 'page', NULL, 176);
INSERT INTO `dc_admin__access` VALUES (2245, 'Role', 72, 1, NULL, 'page', NULL, 172);
INSERT INTO `dc_admin__access` VALUES (2246, 'Role', 72, 1, NULL, 'page', NULL, 173);
INSERT INTO `dc_admin__access` VALUES (2247, 'Role', 72, 1, NULL, 'page', NULL, 174);
INSERT INTO `dc_admin__access` VALUES (2279, 'Role', 63, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (2280, 'Role', 63, 1, NULL, 'page', NULL, 181);
INSERT INTO `dc_admin__access` VALUES (2281, 'Role', 63, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (2282, 'Role', 64, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (2283, 'Role', 64, 1, NULL, 'page', NULL, 182);
INSERT INTO `dc_admin__access` VALUES (2284, 'Role', 64, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (2285, 'Role', 66, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (2286, 'Role', 66, 1, NULL, 'page', NULL, 198);
INSERT INTO `dc_admin__access` VALUES (2287, 'Role', 66, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (2288, 'Role', 65, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (2289, 'Role', 65, 1, NULL, 'page', NULL, 183);
INSERT INTO `dc_admin__access` VALUES (2290, 'Role', 65, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (2291, 'Role', 67, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (2292, 'Role', 67, 1, NULL, 'page', NULL, 204);
INSERT INTO `dc_admin__access` VALUES (2293, 'Role', 67, 1, NULL, 'page', NULL, 201);
INSERT INTO `dc_admin__access` VALUES (2294, 'Role', 67, 1, NULL, 'page', NULL, 202);
INSERT INTO `dc_admin__access` VALUES (2295, 'Role', 67, 1, NULL, 'page', NULL, 203);
INSERT INTO `dc_admin__access` VALUES (2296, 'Role', 67, 1, NULL, 'page', NULL, 224);
INSERT INTO `dc_admin__access` VALUES (2297, 'Role', 67, 1, NULL, 'page', NULL, 200);
INSERT INTO `dc_admin__access` VALUES (2298, 'Role', 67, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (2299, 'Role', 68, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (2300, 'Role', 68, 1, NULL, 'page', NULL, 209);
INSERT INTO `dc_admin__access` VALUES (2301, 'Role', 68, 1, NULL, 'page', NULL, 208);
INSERT INTO `dc_admin__access` VALUES (2302, 'Role', 68, 1, NULL, 'page', NULL, 207);
INSERT INTO `dc_admin__access` VALUES (2303, 'Role', 68, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (2304, 'Role', 69, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (2305, 'Role', 69, 1, NULL, 'page', NULL, 212);
INSERT INTO `dc_admin__access` VALUES (2306, 'Role', 69, 1, NULL, 'page', NULL, 215);
INSERT INTO `dc_admin__access` VALUES (2307, 'Role', 69, 1, NULL, 'page', NULL, 213);
INSERT INTO `dc_admin__access` VALUES (2308, 'Role', 69, 1, NULL, 'page', NULL, 214);
INSERT INTO `dc_admin__access` VALUES (2309, 'Role', 69, 1, NULL, 'page', NULL, 211);
INSERT INTO `dc_admin__access` VALUES (2310, 'Role', 69, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (2311, 'Role', 70, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (2312, 'Role', 70, 1, NULL, 'page', NULL, 217);
INSERT INTO `dc_admin__access` VALUES (2313, 'Role', 70, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (2325, 'Role', 80, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (2326, 'Role', 80, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (2327, 'Role', 80, 1, NULL, 'page', NULL, 225);
INSERT INTO `dc_admin__access` VALUES (2328, 'Role', 80, 1, NULL, 'page', NULL, 226);
INSERT INTO `dc_admin__access` VALUES (2329, 'Role', 80, 1, NULL, 'page', NULL, 227);
INSERT INTO `dc_admin__access` VALUES (2330, 'Role', 80, 1, NULL, 'page', NULL, 228);
INSERT INTO `dc_admin__access` VALUES (2331, 'Role', 81, 1, NULL, 'page', NULL, 223);
INSERT INTO `dc_admin__access` VALUES (2975, 'Role', 71, 1, NULL, 'page', NULL, 12);
INSERT INTO `dc_admin__access` VALUES (2976, 'Role', 71, 1, NULL, 'page', NULL, 163);
INSERT INTO `dc_admin__access` VALUES (2977, 'Role', 71, 1, NULL, 'page', NULL, 184);
INSERT INTO `dc_admin__access` VALUES (2978, 'Role', 71, 1, NULL, 'page', NULL, 185);
INSERT INTO `dc_admin__access` VALUES (2979, 'Role', 71, 1, NULL, 'page', NULL, 186);
INSERT INTO `dc_admin__access` VALUES (2980, 'Role', 61, 1, NULL, 'page', NULL, 1);
INSERT INTO `dc_admin__access` VALUES (2981, 'Role', 61, 1, NULL, 'page', NULL, 2);
INSERT INTO `dc_admin__access` VALUES (2982, 'Role', 61, 1, NULL, 'page', NULL, 3);
INSERT INTO `dc_admin__access` VALUES (2983, 'Role', 61, 1, NULL, 'page', NULL, 4);
INSERT INTO `dc_admin__access` VALUES (2984, 'Role', 61, 1, NULL, 'page', NULL, 5);
INSERT INTO `dc_admin__access` VALUES (2985, 'Role', 61, 1, NULL, 'page', NULL, 6);
INSERT INTO `dc_admin__access` VALUES (2986, 'Role', 61, 1, NULL, 'page', NULL, 7);
INSERT INTO `dc_admin__access` VALUES (2987, 'Role', 61, 1, NULL, 'page', NULL, 8);
INSERT INTO `dc_admin__access` VALUES (2988, 'Role', 61, 1, NULL, 'page', NULL, 9);
INSERT INTO `dc_admin__access` VALUES (2989, 'Role', 61, 1, NULL, 'page', NULL, 10);
INSERT INTO `dc_admin__access` VALUES (2990, 'Role', 61, 1, NULL, 'page', NULL, 12);
INSERT INTO `dc_admin__access` VALUES (2991, 'Role', 61, 1, NULL, 'page', NULL, 134);
INSERT INTO `dc_admin__access` VALUES (2992, 'Role', 61, 1, NULL, 'page', NULL, 136);
INSERT INTO `dc_admin__access` VALUES (2993, 'Role', 61, 1, NULL, 'page', NULL, 162);
INSERT INTO `dc_admin__access` VALUES (2994, 'Role', 61, 1, NULL, 'page', NULL, 163);
INSERT INTO `dc_admin__access` VALUES (2995, 'Role', 61, 1, NULL, 'page', NULL, 164);
INSERT INTO `dc_admin__access` VALUES (2996, 'Role', 61, 1, NULL, 'page', NULL, 165);
INSERT INTO `dc_admin__access` VALUES (2997, 'Role', 61, 1, NULL, 'page', NULL, 166);
INSERT INTO `dc_admin__access` VALUES (2998, 'Role', 61, 1, NULL, 'page', NULL, 167);
INSERT INTO `dc_admin__access` VALUES (2999, 'Role', 61, 1, NULL, 'page', NULL, 168);
INSERT INTO `dc_admin__access` VALUES (3000, 'Role', 61, 1, NULL, 'page', NULL, 169);
INSERT INTO `dc_admin__access` VALUES (3001, 'Role', 61, 1, NULL, 'page', NULL, 171);
INSERT INTO `dc_admin__access` VALUES (3002, 'Role', 61, 1, NULL, 'page', NULL, 172);
INSERT INTO `dc_admin__access` VALUES (3003, 'Role', 61, 1, NULL, 'page', NULL, 173);
INSERT INTO `dc_admin__access` VALUES (3004, 'Role', 61, 1, NULL, 'page', NULL, 174);
INSERT INTO `dc_admin__access` VALUES (3005, 'Role', 61, 1, NULL, 'page', NULL, 176);
INSERT INTO `dc_admin__access` VALUES (3006, 'Role', 61, 1, NULL, 'page', NULL, 177);
INSERT INTO `dc_admin__access` VALUES (3007, 'Role', 61, 1, NULL, 'page', NULL, 178);
INSERT INTO `dc_admin__access` VALUES (3008, 'Role', 61, 1, NULL, 'page', NULL, 179);
INSERT INTO `dc_admin__access` VALUES (3009, 'Role', 61, 1, NULL, 'page', NULL, 180);
INSERT INTO `dc_admin__access` VALUES (3010, 'Role', 61, 1, NULL, 'page', NULL, 181);
INSERT INTO `dc_admin__access` VALUES (3011, 'Role', 61, 1, NULL, 'page', NULL, 182);
INSERT INTO `dc_admin__access` VALUES (3012, 'Role', 61, 1, NULL, 'page', NULL, 183);
INSERT INTO `dc_admin__access` VALUES (3013, 'Role', 61, 1, NULL, 'page', NULL, 184);
INSERT INTO `dc_admin__access` VALUES (3014, 'Role', 61, 1, NULL, 'page', NULL, 185);
INSERT INTO `dc_admin__access` VALUES (3015, 'Role', 61, 1, NULL, 'page', NULL, 186);
INSERT INTO `dc_admin__access` VALUES (3016, 'Role', 61, 1, NULL, 'page', NULL, 187);
INSERT INTO `dc_admin__access` VALUES (3017, 'Role', 61, 1, NULL, 'page', NULL, 191);
INSERT INTO `dc_admin__access` VALUES (3018, 'Role', 61, 1, NULL, 'page', NULL, 193);
INSERT INTO `dc_admin__access` VALUES (3019, 'Role', 61, 1, NULL, 'page', NULL, 194);
INSERT INTO `dc_admin__access` VALUES (3020, 'Role', 61, 1, NULL, 'page', NULL, 195);
INSERT INTO `dc_admin__access` VALUES (3021, 'Role', 61, 1, NULL, 'page', NULL, 196);
INSERT INTO `dc_admin__access` VALUES (3022, 'Role', 61, 1, NULL, 'page', NULL, 197);
INSERT INTO `dc_admin__access` VALUES (3023, 'Role', 61, 1, NULL, 'page', NULL, 198);
INSERT INTO `dc_admin__access` VALUES (3024, 'Role', 61, 1, NULL, 'page', NULL, 200);
INSERT INTO `dc_admin__access` VALUES (3025, 'Role', 61, 1, NULL, 'page', NULL, 201);
INSERT INTO `dc_admin__access` VALUES (3026, 'Role', 61, 1, NULL, 'page', NULL, 202);
INSERT INTO `dc_admin__access` VALUES (3027, 'Role', 61, 1, NULL, 'page', NULL, 203);
INSERT INTO `dc_admin__access` VALUES (3028, 'Role', 61, 1, NULL, 'page', NULL, 204);
INSERT INTO `dc_admin__access` VALUES (3029, 'Role', 61, 1, NULL, 'page', NULL, 205);
INSERT INTO `dc_admin__access` VALUES (3030, 'Role', 61, 1, NULL, 'page', NULL, 206);
INSERT INTO `dc_admin__access` VALUES (3031, 'Role', 61, 1, NULL, 'page', NULL, 207);
INSERT INTO `dc_admin__access` VALUES (3032, 'Role', 61, 1, NULL, 'page', NULL, 208);
INSERT INTO `dc_admin__access` VALUES (3033, 'Role', 61, 1, NULL, 'page', NULL, 209);
INSERT INTO `dc_admin__access` VALUES (3034, 'Role', 61, 1, NULL, 'page', NULL, 211);
INSERT INTO `dc_admin__access` VALUES (3035, 'Role', 61, 1, NULL, 'page', NULL, 212);
INSERT INTO `dc_admin__access` VALUES (3036, 'Role', 61, 1, NULL, 'page', NULL, 213);
INSERT INTO `dc_admin__access` VALUES (3037, 'Role', 61, 1, NULL, 'page', NULL, 214);
INSERT INTO `dc_admin__access` VALUES (3038, 'Role', 61, 1, NULL, 'page', NULL, 215);
INSERT INTO `dc_admin__access` VALUES (3039, 'Role', 61, 1, NULL, 'page', NULL, 216);
INSERT INTO `dc_admin__access` VALUES (3040, 'Role', 61, 1, NULL, 'page', NULL, 217);
INSERT INTO `dc_admin__access` VALUES (3041, 'Role', 61, 1, NULL, 'page', NULL, 218);
INSERT INTO `dc_admin__access` VALUES (3042, 'Role', 61, 1, NULL, 'page', NULL, 219);
INSERT INTO `dc_admin__access` VALUES (3043, 'Role', 61, 1, NULL, 'page', NULL, 220);
INSERT INTO `dc_admin__access` VALUES (3044, 'Role', 61, 1, NULL, 'page', NULL, 221);
INSERT INTO `dc_admin__access` VALUES (3045, 'Role', 61, 1, NULL, 'page', NULL, 223);
INSERT INTO `dc_admin__access` VALUES (3046, 'Role', 61, 1, NULL, 'page', NULL, 224);
INSERT INTO `dc_admin__access` VALUES (3047, 'Role', 61, 1, NULL, 'page', NULL, 225);
INSERT INTO `dc_admin__access` VALUES (3048, 'Role', 61, 1, NULL, 'page', NULL, 226);
INSERT INTO `dc_admin__access` VALUES (3049, 'Role', 61, 1, NULL, 'page', NULL, 227);
INSERT INTO `dc_admin__access` VALUES (3050, 'Role', 61, 1, NULL, 'page', NULL, 228);
INSERT INTO `dc_admin__access` VALUES (3051, 'Role', 61, 1, NULL, 'page', NULL, 229);
INSERT INTO `dc_admin__access` VALUES (3052, 'Role', 61, 1, NULL, 'page', NULL, 230);
INSERT INTO `dc_admin__access` VALUES (3053, 'Role', 61, 1, NULL, 'page', NULL, 238);

-- ----------------------------
-- Table structure for dc_admin__account
-- ----------------------------
DROP TABLE IF EXISTS `dc_admin__account`;
CREATE TABLE `dc_admin__account`  (
  `uid` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `password` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `settings` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` int(10) UNSIGNED NULL DEFAULT 0,
  `update_time` int(10) UNSIGNED NULL DEFAULT 0,
  `status` enum('enable','disable','deleted') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'enable',
  `lastloginip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastlogintime` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_admin__account
-- ----------------------------
INSERT INTO `dc_admin__account` VALUES (1, '$2y$08$d2lrQVdDU2hHRm81WllDNO.t9YUAnGRk5e1D8JYg3eAIFKbSaxURe', NULL, 0, 1538808623, 'enable', '127.0.0.1', 1538808623);
INSERT INTO `dc_admin__account` VALUES (2, '$2y$08$NUpHb0NyaTdrUkd6RENZS.gRFBqdJn5lplgquag8gilSfOfseGjbO', NULL, 1537234494, 1538209520, 'enable', '192.168.76.160', 1537413561);
INSERT INTO `dc_admin__account` VALUES (3, '$2y$08$MFNFQ0pqY1BkZXh0UnlmNOp3wrj6l1tS.sKkSZxwEAYXhtmRptuHW', NULL, 1537280557, 1538209514, 'enable', '192.168.76.160', 1537409105);

-- ----------------------------
-- Table structure for dc_admin__account_to_role
-- ----------------------------
DROP TABLE IF EXISTS `dc_admin__account_to_role`;
CREATE TABLE `dc_admin__account_to_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_userid_rolid`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 447 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员账户-角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_admin__account_to_role
-- ----------------------------
INSERT INTO `dc_admin__account_to_role` VALUES (384, 1, 1);
INSERT INTO `dc_admin__account_to_role` VALUES (446, 2, 61);
INSERT INTO `dc_admin__account_to_role` VALUES (445, 3, 61);
INSERT INTO `dc_admin__account_to_role` VALUES (21, 66, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (22, 67, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (23, 68, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (24, 69, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (26, 71, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (27, 72, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (28, 73, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (29, 74, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (30, 75, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (31, 76, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (32, 77, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (33, 78, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (34, 79, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (35, 80, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (36, 81, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (37, 82, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (38, 83, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (39, 84, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (40, 85, 1);
INSERT INTO `dc_admin__account_to_role` VALUES (42, 87, 1);
INSERT INTO `dc_admin__account_to_role` VALUES (44, 89, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (45, 90, 12);
INSERT INTO `dc_admin__account_to_role` VALUES (46, 91, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (47, 92, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (48, 93, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (50, 95, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (51, 96, 1);
INSERT INTO `dc_admin__account_to_role` VALUES (52, 97, 1);
INSERT INTO `dc_admin__account_to_role` VALUES (53, 98, 3);
INSERT INTO `dc_admin__account_to_role` VALUES (82, 127, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (126, 171, 12);
INSERT INTO `dc_admin__account_to_role` VALUES (135, 180, 1);
INSERT INTO `dc_admin__account_to_role` VALUES (175, 192, 4);
INSERT INTO `dc_admin__account_to_role` VALUES (176, 192, 15);
INSERT INTO `dc_admin__account_to_role` VALUES (369, 231, 46);
INSERT INTO `dc_admin__account_to_role` VALUES (380, 232, 58);
INSERT INTO `dc_admin__account_to_role` VALUES (400, 240, 62);
INSERT INTO `dc_admin__account_to_role` VALUES (401, 240, 63);
INSERT INTO `dc_admin__account_to_role` VALUES (402, 240, 64);
INSERT INTO `dc_admin__account_to_role` VALUES (403, 240, 71);
INSERT INTO `dc_admin__account_to_role` VALUES (404, 240, 72);
INSERT INTO `dc_admin__account_to_role` VALUES (405, 240, 73);
INSERT INTO `dc_admin__account_to_role` VALUES (406, 240, 74);
INSERT INTO `dc_admin__account_to_role` VALUES (407, 240, 75);
INSERT INTO `dc_admin__account_to_role` VALUES (408, 240, 76);
INSERT INTO `dc_admin__account_to_role` VALUES (409, 240, 77);
INSERT INTO `dc_admin__account_to_role` VALUES (410, 240, 79);
INSERT INTO `dc_admin__account_to_role` VALUES (392, 244, 63);
INSERT INTO `dc_admin__account_to_role` VALUES (393, 244, 64);
INSERT INTO `dc_admin__account_to_role` VALUES (394, 244, 65);
INSERT INTO `dc_admin__account_to_role` VALUES (391, 245, 75);
INSERT INTO `dc_admin__account_to_role` VALUES (390, 246, 61);
INSERT INTO `dc_admin__account_to_role` VALUES (435, 258, 61);
INSERT INTO `dc_admin__account_to_role` VALUES (397, 260, 61);
INSERT INTO `dc_admin__account_to_role` VALUES (398, 1119, 61);
INSERT INTO `dc_admin__account_to_role` VALUES (411, 1120, 61);
INSERT INTO `dc_admin__account_to_role` VALUES (441, 1121, 63);
INSERT INTO `dc_admin__account_to_role` VALUES (442, 1121, 71);
INSERT INTO `dc_admin__account_to_role` VALUES (440, 1122, 61);
INSERT INTO `dc_admin__account_to_role` VALUES (436, 1125, 61);
INSERT INTO `dc_admin__account_to_role` VALUES (443, 1126, 61);

-- ----------------------------
-- Table structure for dc_admin__menu
-- ----------------------------
DROP TABLE IF EXISTS `dc_admin__menu`;
CREATE TABLE `dc_admin__menu`  (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `parentid` int(6) NOT NULL DEFAULT 0,
  `settings` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '菜单设置，useIframe：使用layer.open iframe方式，useAjax：使用ajax方式',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `listorder` smallint(6) NOT NULL DEFAULT 0,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `isshow` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理后台菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_admin__menu
-- ----------------------------
INSERT INTO `dc_admin__menu` VALUES (1, '系统设置', 0, '{\"icon\":\"fa-cogs\"}', 'admin/system/set', 61, '', 1);
INSERT INTO `dc_admin__menu` VALUES (2, '后台用户', 1, '{\"icon\":\"fa-user\"}', 'admin/account/list', 62, '管理员列表', 1);
INSERT INTO `dc_admin__menu` VALUES (3, '账户创建', 2, '{\"icon\":\"\"}', 'admin/account/create', 63, '管理员创建', 0);
INSERT INTO `dc_admin__menu` VALUES (4, '账户编辑', 2, '{\"icon\":\"\"}', 'admin/account/edit', 64, '管理员编辑', 0);
INSERT INTO `dc_admin__menu` VALUES (5, '账户删除', 2, '{\"icon\":\"\"}', 'admin/account/delete', 65, '管理员删除', 0);
INSERT INTO `dc_admin__menu` VALUES (6, '账户详情', 2, '{\"icon\":\"fa-grav\"}', 'admin/account/detail', 66, '管理员详情', 0);
INSERT INTO `dc_admin__menu` VALUES (7, '菜单管理', 1, '{\"icon\":\"fa-th-list\"}', 'admin/menu/list', 67, '菜单管理', 1);
INSERT INTO `dc_admin__menu` VALUES (8, '菜单创建', 7, '{\"useIframe\":\"1\"}', 'admin/menu/create', 68, '菜单创建', 0);
INSERT INTO `dc_admin__menu` VALUES (9, '菜单编辑', 7, '{\"useIframe\":\"1\"}', 'admin/menu/edit', 69, '菜单编辑', 0);
INSERT INTO `dc_admin__menu` VALUES (10, '菜单删除', 7, '{\"useAjax\":\"1\"}', 'admin/menu/delete', 70, '菜单删除', 0);
INSERT INTO `dc_admin__menu` VALUES (12, '首页', 0, '{\"icon\":\"fa-home\"}', 'admin/index/index', 0, '首页', 1);
INSERT INTO `dc_admin__menu` VALUES (13, '角色管理', 1, '{\"icon\":\"fa-user-secret\"}', 'admin/role/list', 71, '', 1);
INSERT INTO `dc_admin__menu` VALUES (14, '玩家管理', 0, NULL, 'admin/player/list', 10, '', 1);

-- ----------------------------
-- Table structure for dc_admin__privilege
-- ----------------------------
DROP TABLE IF EXISTS `dc_admin__privilege`;
CREATE TABLE `dc_admin__privilege`  (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `accesskey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grouptype` enum('action','page','data') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'page',
  `app` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_accesskey`(`accesskey`, `app`, `grouptype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2494 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_admin__privilege
-- ----------------------------
INSERT INTO `dc_admin__privilege` VALUES (1, '用户管理', 'admin/account/*', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (2, '列表', 'admin/account/index', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (4, '用户编辑', 'admin/account/edit', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (5, '删除', 'admin/account/delete', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (6, '菜单管理', 'admin/menu/*', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (7, '菜单列表', 'admin/menu/index', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (8, '菜单创建', 'admin/menu/create', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (9, '菜单编辑', 'admin/menu/edit', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (10, '菜单删除', 'admin/menu/delete', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (13, '首页', 'admin/index/index', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (16, '权限管理', 'admin/privilege/*', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (17, '配置用户权限', 'admin/privilege/awarduser', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (18, '权限创建', 'admin/privilege/create', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (19, '编辑权限', 'admin/privilege/edit', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (20, '删除权限', 'admin/privilege/delete', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (22, '权限管理', 'admin/privilege/index', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (23, '用户详情', 'admin/account/detail', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (24, '配置角色权限', 'admin/privilege/awardrole', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (2492, '角色管理', 'admin/role/index', 'page', 'admin');
INSERT INTO `dc_admin__privilege` VALUES (2493, '角色创建', 'admin/role/create', 'page', 'admin');

-- ----------------------------
-- Table structure for dc_admin__role
-- ----------------------------
DROP TABLE IF EXISTS `dc_admin__role`;
CREATE TABLE `dc_admin__role`  (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` enum('enable','disable','deleted') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'enable',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_admin__role
-- ----------------------------
INSERT INTO `dc_admin__role` VALUES (61, '超级管理员', '全权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (62, '大屏权限', '是否拥有大屏访问权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (63, '设备管理_烟感', '只拥有设备管理中的烟感权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (64, '设备管理_井盖', '只拥有井盖操作权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (65, '设备管理_垃圾箱', '拥有设备管理中垃圾箱的权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (66, '设备管理_签到', '设备签到的管理', 'enable');
INSERT INTO `dc_admin__role` VALUES (67, '设备管理_门锁', '智能门锁的权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (68, '设备管理_路灯', '智能路灯的权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (69, '设备管理_停车', '智能停车的管理', 'enable');
INSERT INTO `dc_admin__role` VALUES (70, '设备管理_环境监测', '环境检测管理', 'enable');
INSERT INTO `dc_admin__role` VALUES (71, '巡检管理', '拥有任务_巡检类权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (72, '告警管理', '拥有实时告警和历史告警的权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (73, '告警策略', '拥有告警策略的权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (74, '策略联动', '拥有策略联动的权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (75, '工单管理', '拥有工单管理的权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (76, '区域管理', '拥有区域_组织机构_人员管理和申请审核权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (77, '楼层设计器', '拥有楼层设计的权限', 'enable');
INSERT INTO `dc_admin__role` VALUES (78, '系统设置', '拥有后台最高权限', 'enable');

-- ----------------------------
-- Table structure for dc_deposit
-- ----------------------------
DROP TABLE IF EXISTS `dc_deposit`;
CREATE TABLE `dc_deposit`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `point` float(11, 2) NULL DEFAULT NULL COMMENT '增减金额（提现、调整）',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_deposit
-- ----------------------------
INSERT INTO `dc_deposit` VALUES (1, 'superadmin', 1, 100.00, 1538837188);
INSERT INTO `dc_deposit` VALUES (2, 'player1', 2, 1.00, 1538837397);
INSERT INTO `dc_deposit` VALUES (3, '匹配88', 12, 0.00, 1538837817);

-- ----------------------------
-- Table structure for dc_flow
-- ----------------------------
DROP TABLE IF EXISTS `dc_flow`;
CREATE TABLE `dc_flow`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `createtime` int(11) NULL DEFAULT NULL COMMENT '本局录入时间',
  `gain_point` float(11, 2) NULL DEFAULT NULL COMMENT '本局平台盈利',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of dc_flow
-- ----------------------------
INSERT INTO `dc_flow` VALUES (3, 1538821892, 160.00);
INSERT INTO `dc_flow` VALUES (2, 1538821757, 35.00);
INSERT INTO `dc_flow` VALUES (4, 1538835081, 95.50);
INSERT INTO `dc_flow` VALUES (5, 1538838353, 64.25);

-- ----------------------------
-- Table structure for dc_flow_detail
-- ----------------------------
DROP TABLE IF EXISTS `dc_flow_detail`;
CREATE TABLE `dc_flow_detail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `flowid` int(11) NULL DEFAULT NULL COMMENT '局id',
  `real_point` float(11, 2) NULL DEFAULT NULL COMMENT '用户本局分数',
  `left_point` float(11, 2) NULL DEFAULT NULL COMMENT '用户本局结余',
  `plat_point` float(11, 2) NULL DEFAULT NULL COMMENT '平台本局抽水',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '本局时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of dc_flow_detail
-- ----------------------------
INSERT INTO `dc_flow_detail` VALUES (1, 2, 2, 700.00, 665.00, 35.00, 1538821757);
INSERT INTO `dc_flow_detail` VALUES (2, 6, 2, -700.00, -700.00, 0.00, 1538821757);
INSERT INTO `dc_flow_detail` VALUES (3, 2, 3, 600.00, 570.00, 30.00, 1538821892);
INSERT INTO `dc_flow_detail` VALUES (4, 3, 3, 800.00, 760.00, 40.00, 1538821892);
INSERT INTO `dc_flow_detail` VALUES (5, 4, 3, 1800.00, 1710.00, 90.00, 1538821892);
INSERT INTO `dc_flow_detail` VALUES (6, 5, 3, -3200.00, -3200.00, 0.00, 1538821892);
INSERT INTO `dc_flow_detail` VALUES (7, 2, 4, 664.00, 630.80, 33.20, 1538835081);
INSERT INTO `dc_flow_detail` VALUES (8, 3, 4, 1023.00, 971.85, 51.15, 1538835081);
INSERT INTO `dc_flow_detail` VALUES (9, 4, 4, 223.00, 211.85, 11.15, 1538835081);
INSERT INTO `dc_flow_detail` VALUES (10, 5, 4, -1910.00, -1910.00, 0.00, 1538835081);
INSERT INTO `dc_flow_detail` VALUES (11, 2, 5, 288.00, 273.60, 14.40, 1538838353);
INSERT INTO `dc_flow_detail` VALUES (12, 3, 5, 111.00, 105.45, 5.55, 1538838353);
INSERT INTO `dc_flow_detail` VALUES (13, 4, 5, -163.00, -163.00, 0.00, 1538838353);
INSERT INTO `dc_flow_detail` VALUES (14, 6, 5, -999.00, -999.00, 0.00, 1538838353);
INSERT INTO `dc_flow_detail` VALUES (15, 11, 5, 886.00, 841.70, 44.30, 1538838353);
INSERT INTO `dc_flow_detail` VALUES (16, 12, 5, -123.00, -123.00, 0.00, 1538838353);

-- ----------------------------
-- Table structure for dc_player
-- ----------------------------
DROP TABLE IF EXISTS `dc_player`;
CREATE TABLE `dc_player`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '微信名',
  `point` float(11, 2) NULL DEFAULT NULL COMMENT '历史结余',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_player
-- ----------------------------
INSERT INTO `dc_player` VALUES (1, 'superadmin', 100.00);
INSERT INTO `dc_player` VALUES (2, 'player1', 2141.40);
INSERT INTO `dc_player` VALUES (3, 'player2', 1838.30);
INSERT INTO `dc_player` VALUES (4, 'player3', 1759.85);
INSERT INTO `dc_player` VALUES (5, 'player4', -5087.00);
INSERT INTO `dc_player` VALUES (6, 'player5', -1696.00);
INSERT INTO `dc_player` VALUES (7, 'player6', 9.00);
INSERT INTO `dc_player` VALUES (8, 'player7', 10.00);
INSERT INTO `dc_player` VALUES (9, 'player8', 21.00);
INSERT INTO `dc_player` VALUES (10, 'pp1', 888.00);
INSERT INTO `dc_player` VALUES (11, 'pp2', -46.30);
INSERT INTO `dc_player` VALUES (12, '匹配88', -123.00);

-- ----------------------------
-- Table structure for dc_system
-- ----------------------------
DROP TABLE IF EXISTS `dc_system`;
CREATE TABLE `dc_system`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '参数名',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '参数说明',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_system
-- ----------------------------
INSERT INTO `dc_system` VALUES (1, 'base_point', '基数', '100');
INSERT INTO `dc_system` VALUES (2, 'base_percent', '抽水比例', '0.05');
INSERT INTO `dc_system` VALUES (3, 'game_players', '每局游戏用户', '6');

-- ----------------------------
-- Table structure for dc_user
-- ----------------------------
DROP TABLE IF EXISTS `dc_user`;
CREATE TABLE `dc_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '头像',
  `score` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '积分',
  `money` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '余额',
  `reg_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册IP',
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户联系邮箱',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `status` enum('enable','disable','deleted') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'enable',
  `lastloginip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastlogintime` int(10) UNSIGNED NULL DEFAULT 0,
  `mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pk_username_email_mobile`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dc_user
-- ----------------------------
INSERT INTO `dc_user` VALUES (1, 'superadmin', '19b7f16a32ac49fdf276d20b65a311c1', '3is1s', 0, 0, 0.00, '127.0.0.1', 'admin@admin.com', 1438651748, 1537327474, 'enable', NULL, 0, '15900000000');
INSERT INTO `dc_user` VALUES (2, 'qh_admin', '', 'eUE9PQ', 0, 0, 0.00, '192.168.76.160', '18999999999@189.cn', 1537234494, 1538209520, 'enable', NULL, 0, '18999999999');
INSERT INTO `dc_user` VALUES (3, 'bd_admin', '', 'U3c9PQ', 0, 0, 0.00, '192.168.76.160', '123323@qq.com', 1537280557, 1538209514, 'enable', NULL, 0, '13456787898');

SET FOREIGN_KEY_CHECKS = 1;
