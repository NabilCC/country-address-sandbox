package net.model;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@NoArgsConstructor @AllArgsConstructor
@Builder(toBuilder = true)
@JsonPropertyOrder({"assetId", "frameId", "businessUnit", "address"})
public class Asset {
    private Long assetId;
    private Long frameId;
    private String businessUnit;
    private Map<String, Object> address;
}
