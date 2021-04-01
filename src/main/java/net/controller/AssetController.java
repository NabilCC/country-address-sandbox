package net.controller;

import lombok.SneakyThrows;
import net.model.Asset;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import static java.lang.Boolean.TRUE;

@RestController
public class AssetController {

    private static final String L1 = "level_1", L2 = "level_2", L3 = "level_3", L4 = "level_4";

    private final JdbcTemplate template;
    private final Map<String, Map<String, String>> mappings;

    public AssetController(JdbcTemplate template) {
        this.template = template;
        this.mappings = template.query("SELECT * FROM address_mapping;", AssetController::extractMappings);
    }

    @GetMapping("/assets")
    public List<Asset> getAssets(@RequestParam(name = "translate", required = false) Boolean translate, @RequestParam(name = "unit", required = false) String unit) {
        if (unit == null) {
            return template.query("select * from asset a inner join address ad on ad.address_id = a.address_id;", rs -> {
                return AssetController.extractAssets(rs, mappings, TRUE.equals(translate));
            });
        } else {
            return template.query("select * from asset a inner join address ad on ad.address_id = a.address_id WHERE business_unit = '" + unit + "'", rs -> {
                return AssetController.extractAssets(rs, mappings, TRUE.equals(translate));
            });
        }
    }

    @SneakyThrows
    private static Map<String, Map<String, String>> extractMappings(ResultSet rs) {
        Map<String, Map<String, String>> result = new HashMap<>();
        while (rs.next()) {
            Map<String, String> mappingsForBu = new HashMap<>();
            result.put(rs.getString("business_unit"), mappingsForBu);

            mappingsForBu.put(L1, rs.getString(L1));
            mappingsForBu.put(L2, rs.getString(L2));
            mappingsForBu.put(L3, rs.getString(L3));
            mappingsForBu.put(L4, rs.getString(L4));
        }
        return result;
    }

    @SneakyThrows
    private static List<Asset> extractAssets(ResultSet rs, Map<String, Map<String, String>> mappings, Boolean translate) {
        List<Asset> result = new ArrayList<>();
        while (rs.next()) {
            Asset asset = new Asset();
            Map<String,Object> address = new LinkedHashMap<>();
            asset.setAddress(address);
            result.add(asset);

            String business_unit = rs.getString("business_unit");

            String level1 = rs.getString(L1);
            if (level1 != null) {
                address.put(translate ? mappingFor(business_unit, L1, mappings) : L1, level1);
            }
            String level2 = rs.getString(L2);
            if (level2 != null) {
                address.put(translate ? mappingFor(business_unit, L2, mappings) : L2, level2);
            }
            String level3 = rs.getString(L3);
            if (level3 != null) {
                address.put(translate ? mappingFor(business_unit, L3, mappings) : L3, level3);
            }
            String level4 = rs.getString(L4);
            if (level4 != null) {
                address.put(translate ? mappingFor(business_unit, L4, mappings) : L4, level4);
            }

            address.put("address", rs.getString("address"));
            address.put("postcode", rs.getString("postcode"));
            address.put("latitude", rs.getString("latitude"));
            address.put("longitude", rs.getString("longitude"));

            asset.setAssetId(rs.getLong("asset_id"));
            asset.setFrameId(rs.getLong("frame_id"));
            asset.setBusinessUnit(business_unit);
        }
        return result;
    }

    private static String mappingFor(String businessUnit, String level, Map<String, Map<String, String>> mappings) {
        return mappings.get(businessUnit).get(level);
    }
}
