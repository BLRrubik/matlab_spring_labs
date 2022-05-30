package ru.rubik.matlabweb.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ru.rubik.matlabweb.properties.Property;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ResultDTO {
    private List<Property> prime;
    private List<Property> back;
}
