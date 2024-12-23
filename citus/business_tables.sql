INSERT INTO system_parameters.business_tables (table_name, table_label, is_archive, description)
VALUES
    ('algorithms', 'Thuật toán', false ,'Bảng lưu thông tin thuật toán giao dịch'),
    ('transactions', 'Giao dịch', true ,'Bảng lưu thông tin chi tiết về giao dịch');

INSERT INTO system_parameters.business_fields (table_id, field_name, field_type, label, description, 
is_primary_key, is_nullable, default_value, is_required, options, is_hidden, 
is_foreign_key, referenced_table_id, referenced_field_id)
VALUES
    (1, 'algorithm_name', 'VARCHAR(255)', 'Tên thuật toán', 'Tên của thuật toán'),
    (1, 'algorithm_type', 'VARCHAR(255)', 'Loại hình thuật toán', 'Thuật toán giao dịch theo xu hướng, giao dịch tần suất cao, dựa trên AI/ML, v.v.'),
    (1, 'algorithm_goal', 'VARCHAR(255)', 'Mục tiêu thuật toán', 'Tối đa hóa lợi nhuận, giảm thiểu rủi ro, đa dạng hóa danh mục đầu tư'),
    (1, 'operation_rules', 'VARCHAR(255)', 'Quy tắc hoạt động', 'Chỉ báo kỹ thuật, phân tích cơ bản'),
    (1, 'expected_return', 'FLOAT', 'Lợi nhuận kỳ vọng', 'Tỷ lệ lợi nhuận bình quân hoặc CAGR (Compound Annual Growth Rate)'),
    (1, 'win_rate', 'FLOAT', 'Tỷ lệ thắng', 'Số lần giao dịch có lãi so với tổng số giao dịch'),
    (1, 'annual_return', 'FLOAT', 'Tỷ suất sinh lợi hàng năm', 'Lợi nhuận đạt được hàng năm qua các năm'),
    (1, 'return_from_peak', 'FLOAT', 'Lợi nhuận từ đỉnh', 'Phân tích hiệu suất khi thị trường đạt đỉnh để đánh giá hiệu quả'),
    (1, 'max_drawdown', 'FLOAT', 'Max Drawdown (MDD)', 'Mức giảm lớn nhất từ đỉnh cao nhất đến đáy thấp nhất trong một khoảng thời gian'),
    (1, 'volatility', 'FLOAT', 'Volatility (Độ biến động)', 'Mức độ dao động giá của danh mục đầu tư'),
    (1, 'sharpe_ratio', 'FLOAT', 'Sharpe Ratio', 'Tỷ lệ giữa lợi nhuận trên rủi ro để đánh giá mức độ hấp dẫn của chiến lược'),
    (1, 'sortino_ratio', 'FLOAT', 'Sortino Ratio', 'Giống Sharpe Ratio nhưng chỉ tính mức độ rủi ro khi lợi nhuận âm, loại bỏ biến động tích cực'),
    (1, 'market_risk', 'FLOAT', 'Rủi ro thị trường', 'Mức độ ảnh hưởng từ các yếu tố thị trường đến chiến lược đầu tư'),
    (1, 'transaction_frequency', 'INT', 'Tần suất giao dịch', 'Tần suất thực hiện giao dịch để xác định tính bền vững và chi phí liên quan'),
    (1, 'operating_time', 'INT', 'Thời gian hoạt động', 'Thời gian chạy thử và kiểm tra thực tế để xác định độ tin cậy và hiệu quả qua thời gian');
    
INSERT INTO system_parameters.business_fields (table_id, field_name, field_type, label, description)
VALUES
    (2, 'algorithm_id', 'INT', 'ID liên kết tới bảng thuật toán Algorithms', 'ID tham chiếu tới thuật toán áp dụng trong giao dịch'),
    (2, 'transaction_code', 'VARCHAR(255)', 'Mã giao dịch', 'Mã định danh duy nhất cho mỗi giao dịch'),
    (2, 'transaction_time', 'TIMESTAMP', 'Thời gian giao dịch', 'Ngày và giờ thực hiện giao dịch'),
    (2, 'transaction_type', 'VARCHAR(50)', 'Loại giao dịch', 'Mua (buy) hoặc bán (sell)'),
    (2, 'market', 'VARCHAR(255)', 'Thị trường', 'Sàn giao dịch nơi giao dịch được thực hiện (ví dụ: NYSE, NASDAQ)'),
    (2, 'asset_code', 'VARCHAR(255)', 'Mã chứng khoán hoặc tài sản', 'Mã cổ phiếu, tiền điện tử hoặc tài sản được giao dịch (ví dụ: AAPL, BTC)'),
    (2, 'asset_type', 'VARCHAR(255)', 'Loại tài sản', 'Cổ phiếu, trái phiếu, tiền điện tử, ngoại tệ, hàng hóa, v.v.'),
    (2, 'quantity', 'INT', 'Số lượng tài sản', 'Số lượng cổ phiếu, đơn vị tiền điện tử hoặc khối lượng tài sản được giao dịch'),
    (2, 'price', 'FLOAT', 'Giá mua/bán', 'Giá tại thời điểm thực hiện giao dịch'),
    (2, 'total_value', 'FLOAT', 'Tổng giá trị giao dịch', 'Số lượng * giá mua/bán, thường tính bằng đơn vị tiền tệ (ví dụ: USD, VND)'),
    (2, 'transaction_fee', 'FLOAT', 'Phí giao dịch', 'Phí môi giới hoặc phí sàn giao dịch áp dụng cho mỗi giao dịch'),
    (2, 'tax', 'FLOAT', 'Thuế', NULL),
    (2, 'transaction_reason', 'VARCHAR(255)', 'Lý do giao dịch', 'Cơ sở hoặc chiến lược giao dịch (ví dụ: phân tích kỹ thuật, phân tích cơ bản, điều chỉnh danh mục)'),
    (2, 'trigger_signal', 'VARCHAR(255)', 'Chỉ báo hoặc tín hiệu kích hoạt giao dịch', 'Các tín hiệu hoặc chỉ báo (như RSI, MACD) tạo cơ sở cho quyết định giao dịch'),
    (2, 'risk_limit', 'FLOAT', 'Giới hạn rủi ro', 'Tỷ lệ cắt lỗ hoặc mức độ rủi ro tối đa chấp nhận cho giao dịch'),
    (2, 'profit_target', 'FLOAT', 'Tỷ lệ chốt lời', 'Mức giá kỳ vọng để chốt lời'),
    (2, 'risk_reward_ratio', 'FLOAT', 'Tỷ lệ rủi ro-lợi nhuận', 'Tỷ lệ giữa mức rủi ro và lợi nhuận kỳ vọng cho giao dịch'),
    (2, 'transaction_status', 'VARCHAR(50)', 'Tình trạng giao dịch', 'Trạng thái hiện tại (ví dụ: đã hoàn thành, đang chờ xử lý, hủy)'),
    (2, 'order_type', 'VARCHAR(50)', 'Phương thức giao dịch', 'Lệnh thị trường (market order), lệnh giới hạn (limit order), hoặc lệnh dừng (stop order)'),
    (2, 'execution_time', 'TIMESTAMP', 'Thời gian thực hiện', 'Thời gian khớp lệnh hoặc hoàn thành giao dịch (nếu có)'),
    (2, 'slippage', 'FLOAT', 'Trượt giá', 'Chênh lệch giữa giá đặt lệnh và giá thực hiện, nếu có'),
    (2, 'actual_profit_loss', 'FLOAT', 'Lãi/lỗ thực tế', 'Lợi nhuận hoặc lỗ nhận được từ giao dịch (tính toán sau khi trừ các phí)'),
    (2, 'estimated_profit_loss', 'FLOAT', 'Lãi/lỗ dự kiến', 'Lãi hoặc lỗ ước tính tại thời điểm kết thúc giao dịch, so với giá mua vào'),
    (2, 'holding_time', 'INT', 'Thời gian nắm giữ', 'Khoảng thời gian giữa lúc mua vào và lúc bán ra'),
    (2, 'leverage_ratio', 'FLOAT', 'Tỷ lệ đòn bẩy', 'Nếu giao dịch có sử dụng đòn bẩy, cần ghi lại mức đòn bẩy được sử dụng'),
    (2, 'related_market_event', 'VARCHAR(255)', 'Sự kiện thị trường liên quan', 'Bất kỳ tin tức hoặc sự kiện nào có tác động đến quyết định giao dịch (ví dụ: báo cáo lợi nhuận, chính sách lãi suất)');
