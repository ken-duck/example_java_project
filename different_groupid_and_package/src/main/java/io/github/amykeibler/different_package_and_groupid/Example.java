package io.github.amykeibler.different_package_and_groupid;

import java.util.Locale;

/**
 * Example documentation
 */
public class Example
{
  /**
   * Example function
   * @param input The text to be modified
   * @return The modified text
   */
  public String example(String input) {
    return input.toLowerCase(Locale.getDefault());
  }

  public boolean isExample(String input) {
    return true;
  }
}