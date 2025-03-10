package com.verenich.exception;


/**
 * Class representing XML validation exception
 */
public class XMLValidatorException extends Exception {

    /**
     * Constructor with specified string
     *
     * @param message string
     */
    public XMLValidatorException(String message) {
        super(message);
    }

    /**
     * Constructor with specified string and exception
     *
     * @param message string
     * @param e       error covered
     */
    public XMLValidatorException(String message, Throwable e) {
        super(message, e);
    }

    @Override
    public String getMessage() {
        return super.getMessage();
    }

    @Override
    public void printStackTrace() {
        super.printStackTrace();
    }

}