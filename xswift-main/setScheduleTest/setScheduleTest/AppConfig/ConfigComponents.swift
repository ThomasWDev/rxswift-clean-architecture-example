//
//  ConfigComponents.swift
//  setScheduleTest
//
//  Created by Thomas Woodfin 2/15/21.
//

import UIKit

public enum ThemeType{
    case NORMAL
    case DARK
}

// theme color collection
public class Colors {
    public var mainThemeColor: UIColor?
    public var mainNavBarColor: UIColor?
    public var mainButtonColor: UIColor?
    public var mainTextColor: UIColor?
    public var disabledTextColor: UIColor?
    public var whiteTransparentColor: UIColor?
    public var textFieldBGColor: UIColor?
}

// fonts collection
public class Fonts {
    public var primaryNormal: UIFont?
    public var primaryBold: UIFont?
    public var primarySemibold: UIFont?
}
