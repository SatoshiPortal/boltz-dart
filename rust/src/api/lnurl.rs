/// LNURL helper to validate an lnurl string
pub fn validate_lnurl(lnurl: String) -> bool {
    lnurl::validate_lnurl(&lnurl)
}

/// LNURL helper to get an invoice from an lnurl string
pub async fn invoice_from_lnurl(lnurl: String, msats: u64) -> Result<String, BoltzError> {
    Ok(lnurl::fetch_invoice(&lnurl, msats).await?)
}

/// LNURL helper to get an lnurl-w voucher amount
pub async fn get_voucher_max_amount(lnurl: String) -> Result<u64, BoltzError> {
    let max_withdrawable_msat = lnurl::create_withdraw_response(&lnurl)
        .await?
        .max_withdrawable;
    Ok(max_withdrawable_msat / 1000)
}

/// LNURL helper to claim an lnurl-w
pub async fn withdraw(lnurl: String, invoice: String) -> Result<(), BoltzError> {
    Ok(
        lnurl::process_withdrawal(&lnurl::create_withdraw_response(&lnurl).await?, &invoice)
            .await?,
    )
}
