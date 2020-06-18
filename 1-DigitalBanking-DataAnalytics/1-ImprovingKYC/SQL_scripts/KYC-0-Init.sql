DROP TABLE IF EXISTS facial_similarity_reports;
DROP TABLE IF EXISTS doc_reports;

CREATE TABLE facial_similarity_reports (
  number INTEGER NOT NULL,
  user_id VARCHAR(36) NOT NULL,
  result VARCHAR(20),
  face_comparison_result VARCHAR(20),
  created_at VARCHAR(20),
  facial_image_integrity_result VARCHAR(20),
  visual_authenticity_result VARCHAR(20),
  properties VARCHAR(20),
  attempt_id VARCHAR(36) NOT NULL
);

CREATE TABLE doc_reports (
    number INTEGER NOT NULL,
    user_id VARCHAR(36) NOT NULL,
    result VARCHAR(20),
    visual_authenticity_result VARCHAR(20),
    image_integrity_result VARCHAR(20),
    face_detection_result VARCHAR(20),
    image_quality_result VARCHAR(20),
    created_at VARCHAR(20),
    supported_document_result VARCHAR(20),
    conclusive_document_quality_result VARCHAR(20),
    colour_picture_result VARCHAR(20),
    data_validation_result VARCHAR(20),
    data_consistency_result VARCHAR(20),
    data_comparison_result VARCHAR(20),
    attempt_id VARCHAR(36) NOT NULL,
    police_record_result VARCHAR(20),
    compromised_document_result VARCHAR(20),
    properties VARCHAR(200),
    sub_result VARCHAR(20)
);
