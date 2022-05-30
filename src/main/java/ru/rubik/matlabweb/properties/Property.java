package ru.rubik.matlabweb.properties;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Property {
    private int id;
    private Double overshoot;
    private Double time_r;
    private Double time_n;
}
